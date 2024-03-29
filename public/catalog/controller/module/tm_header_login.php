<?php
class ControllerModuleTmHeaderLogin extends Controller {
    private $error = array();

    public function index() {
        $this->load->model('account/customer');

        // Login override for admin users
        if (!empty($this->request->get['token'])) {
            $this->event->trigger('pre.customer.login');

            $this->customer->logout();
            $this->cart->clear();

            unset($this->session->data['wishlist']);
            unset($this->session->data['payment_address']);
            unset($this->session->data['payment_method']);
            unset($this->session->data['payment_methods']);
            unset($this->session->data['shipping_address']);
            unset($this->session->data['shipping_method']);
            unset($this->session->data['shipping_methods']);
            unset($this->session->data['comment']);
            unset($this->session->data['order_id']);
            unset($this->session->data['coupon']);
            unset($this->session->data['reward']);
            unset($this->session->data['voucher']);
            unset($this->session->data['vouchers']);

            $customer_info = $this->model_account_customer->getCustomerByToken($this->request->get['token']);

            if ($customer_info && $this->customer->login($customer_info['email'], '', true)) {
                // Default Addresses
                $this->load->model('account/address');

                if ($this->config->get('config_tax_customer') == 'payment') {
                    $this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
                }

                if ($this->config->get('config_tax_customer') == 'shipping') {
                    $this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
                }

                $this->event->trigger('post.customer.login');

                $this->response->redirect($this->url->link('account/account', '', 'SSL'));
            }
        }

        $this->load->language('account/login');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            unset($this->session->data['guest']);

            // Default Shipping Address
            $this->load->model('account/address');

            if ($this->config->get('config_tax_customer') == 'payment') {
                $this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
            }

            if ($this->config->get('config_tax_customer') == 'shipping') {
                $this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
            }

            // Add to activity log
            $this->load->model('account/activity');

            $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
            );

            $this->model_account_activity->addActivity('login', $activity_data);

            // Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
            if (isset($this->request->post['header-login-redirect']) && (strpos($this->request->post['header-login-redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['header-login-redirect'], $this->config->get('config_ssl')) !== false)) {
                $this->response->redirect(str_replace('&amp;', '&', $this->request->post['header-login-redirect']));
            } else {
                $this->response->redirect($this->url->link('account/account', '', 'SSL'));
            }
        }

        $data['text_new_customer'] = $this->language->get('text_new_customer');
        $data['text_register'] = $this->language->get('text_register');
        $data['text_register_account'] = $this->language->get('text_register_account');
        $data['text_returning_customer'] = $this->language->get('text_returning_customer');
        $data['text_i_am_returning_customer'] = $this->language->get('text_i_am_returning_customer');
        $data['text_forgotten'] = $this->language->get('text_forgotten');

        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_password'] = $this->language->get('entry_password');

        $data['button_continue'] = $this->language->get('button_continue');
        $data['button_login'] = $this->language->get('button_login');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['action'] = $this->url->link('account/login', '', 'SSL');
        $data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');

        // Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
        if (isset($this->request->post['header-login-redirect']) && (strpos($this->request->post['header-login-redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['header-login-redirect'], $this->config->get('config_ssl')) !== false)) {
            $data['redirect'] = $this->request->post['header-login-redirect'];
        } elseif (isset($this->session->data['redirect'])) {
            $data['redirect'] = $this->session->data['header-login-redirect'];

            unset($this->session->data['header-login-redirect']);
        } else {
            $data['redirect'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['header-login-email'])) {
            $data['email'] = $this->request->post['header-login-email'];
        } else {
            $data['email'] = '';
        }

        if (isset($this->request->post['header-login-password'])) {
            $data['password'] = $this->request->post['header-login-password'];
        } else {
            $data['password'] = '';
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/tm_header_login.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/tm_header_login.tpl', $data);
        } else {
            return $this->load->view('default/template/module/tm_header_login.tpl', $data);;
        }
    }

    protected function validate() {
        // Check how many login attempts have been made.
        if (isset($this->request->post['header-login-password']) && isset($this->request->post['header-login-email'])) {
            $login_info = $this->model_account_customer->getLoginAttempts($this->request->post['header-login-email']);

            if ($login_info && ($login_info['total'] > $this->config->get('config_login_attempts')) && strtotime('-1 hour') < strtotime($login_info['date_modified'])) {
                $this->error['warning'] = $this->language->get('error_attempts');
            }

            // Check if customer has been approved.
            $customer_info = $this->model_account_customer->getCustomerByEmail($this->request->post['header-login-email']);

            if ($customer_info && !$customer_info['approved']) {
                $this->error['warning'] = $this->language->get('error_approved');
            }

            if (!$this->error) {
                if (!$this->customer->login($this->request->post['header-login-email'], $this->request->post['header-login-password'])) {
                    $this->error['warning'] = $this->language->get('error_login');

                    $this->model_account_customer->addLoginAttempt($this->request->post['header-login-email']);
                } else {
                    $this->model_account_customer->deleteLoginAttempts($this->request->post['header-login-email']);
                }
            }

            return !$this->error;
        }
    }
}