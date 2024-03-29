<?php
    class ControllerSimpleBlogComment extends Controller {
    	private $error = array();
		
        public function index() {
            $url = $this->request->get['route'];
            if($this->checkDatabase()) {
                
                $this->language->load('simple_blog/install');
                
                $this->document->setTitle($this->language->get('error_database'));
                
                $data['install_database'] = $this->url->link('simple_blog/install/installDatabase', 'token=' . $this->session->data['token'] . '&url=' . $url, 'SSL');
                
                $data['text_install_message'] = $this->language->get('text_install_message');
                
                $data['text_upgread'] = $this->language->get('text_upgread');
                
                $data['error_database'] = $this->language->get('error_database');
                
                $data['breadcrumbs'] = array();

    	   		$data['breadcrumbs'][] = array(
    	       		'text'      => $this->language->get('text_home'),
    				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
    	      		'separator' => false
    	   		);
                
                $data['header'] = $this->load->controller('common/header');
      		    $data['column_left'] = $this->load->controller('common/column_left');
                $data['footer'] = $this->load->controller('common/footer');
        
                $this->response->setOutput($this->load->view('simple_blog/notification.tpl', $data));
                
            } else {
                $this->getData();
            }	
		}
		
        public function checkDatabase() {
            $database_not_found = $this->load->controller('simple_blog/install/validateTable');
            
            if(!$database_not_found) {
                return true;
            } 
            
            return false;
        }
        
        public function getData() {
            $this->language->load('simple_blog/comment');

			$this->document->setTitle($this->language->get('heading_title'));
            $data['text_confirm'] = $this->language->get('text_confirm');

			$this->load->model('simple_blog/comment');
	
			$this->getList();
        }
        
		public function insert() {
			$this->language->load('simple_blog/comment');

			$this->document->setTitle($this->language->get('heading_title'));
	
			$this->load->model('simple_blog/comment');
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateForm())) {
				//print "<pre>"; print_r($this->request->post); exit;
				$this->model_simple_blog_comment->addArticleComment($this->request->post);
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				
				$this->response->redirect($this->url->link('simple_blog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL'));				
			}
			
			$this->getForm();
		}
		
		public function update() {
			$this->language->load('simple_blog/comment');

			$this->document->setTitle($this->language->get('heading_title'));
	
			$this->load->model('simple_blog/comment');
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateForm())) {
				//print "<pre>"; print_r($this->request->post); exit;
				$this->model_simple_blog_comment->editArticleComment($this->request->get['simple_blog_comment_id'], $this->request->post);
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				$this->response->redirect($this->url->link('simple_blog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			}
			
			$this->getForm();
		}
	
		public function delete() {
			$this->language->load('simple_blog/comment');

			$this->document->setTitle($this->language->get('heading_title'));
	
			$this->load->model('simple_blog/comment');
			
			if (isset($this->request->post['selected']) && $this->validateDelete()) {
				
				foreach ($this->request->post['selected'] as $blog_comment_id) {
					$this->model_simple_blog_comment->deleteArticleComment($blog_comment_id);
				}
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				
				$this->response->redirect($this->url->link('simple_blog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			}			
			$this->getList();
		}
		
		public function getList() {
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}
			if (isset($this->request->get['sort'])) {
				$sort = $this->request->get['sort'];
			} else {
				$sort = 'bc.date_added';
			}
			if (isset($this->request->get['order'])) {
				$order = $this->request->get['order'];
			} else {
				$order = 'DESC';
			}	
			
            if (isset($this->request->post['selected'])) {
    			$data['selected'] = (array)$this->request->post['selected'];
    		} else {
    			$data['selected'] = array();
    		}
            
			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$data['breadcrumbs'] = array();

	   		$data['breadcrumbs'][] = array(
	       		'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	      		'separator' => false
	   		);
	
	   		$data['breadcrumbs'][] = array(
	       		'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('simple_blog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL'),
	      		'separator' => ' :: '
	   		);
			
			$data['insert'] = $this->url->link('simple_blog/comment/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
			$data['delete'] = $this->url->link('simple_blog/comment/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
			
			$data['comments'] = array();
			
			$filter_data = array(
				'sort'  => $sort,
				'order' => $order,
				'simple_blog_article_reply_id'	=> 0,
				'start' => ($page - 1) * $this->config->get('config_admin_limit'),
				'limit' => $this->config->get('config_admin_limit')
			);
			
			$comment_total = $this->model_simple_blog_comment->getTotalArticleComment($filter_data);

			
			$results = $this->model_simple_blog_comment->getArticleComments($filter_data);
			
			foreach($results as $result) {
                $replies = $this->model_simple_blog_comment->getCommentReply($result['simple_blog_comment_id']);
                $reply_unchecked = 0;
                foreach ($replies as $reply){
                    if ($reply['status'] == 0){
                        $reply_unchecked++;
                    }
                }

				$data['comments'][] = array(
					'simple_blog_comment_id'	=> $result['simple_blog_comment_id'],
					'simple_blog_article_id' 	=> $result['simple_blog_article_id'],
					'article_title'		=> $result['article_title'],
					'author_name'       => $result['author'],					
					'reply_unchecked'       => $reply_unchecked,
					'status'      		=> ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
					'date_added'		=> date($this->language->get('date_format_short'), strtotime($result['date_added'])),
					'selected'        	=> isset($this->request->post['selected']) && in_array($result['simple_blog_comment_id'], $this->request->post['selected']),
					'edit'          	=> $this->url->link('simple_blog/comment/update', 'token=' . $this->session->data['token'] . '&simple_blog_comment_id=' . $result['simple_blog_comment_id'] . $url, 'SSL')
				);		
			}
			
			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_no_results'] = $this->language->get('text_no_results');
			$data['text_reply_unchecked'] = $this->language->get('text_reply_unchecked');
            $data['text_confirm'] = $this->language->get('text_confirm');

			$data['column_article_title'] = $this->language->get('column_article_title');
			$data['column_author_name'] = $this->language->get('column_author_name');
			$data['column_status'] = $this->language->get('column_status');
			$data['column_date_added'] = $this->language->get('column_date_added');
			$data['column_action'] = $this->language->get('column_action');	
	
			$data['button_insert'] = $this->language->get('button_insert');
			$data['button_delete'] = $this->language->get('button_delete');
            $data['button_edit'] = $this->language->get('button_edit');
			
			$data['token'] = $this->session->data['token'];
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
			} else {
				$data['error_warning'] = '';
			}
	
			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];
	
				unset($this->session->data['success']);
			} else {
				$data['success'] = '';
			}
			
			$url = '';

			if ($order == 'ASC') {
				$url .= '&order=DESC';
			} else {
				$url .= '&order=ASC';
			}
	
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
	
			$data['sort_article_title'] = $this->url->link('simple_blog/comment', 'token=' . $this->session->data['token'] . '&sort=sbad.article_title' . $url, 'SSL');
			$data['sort_author_name'] = $this->url->link('simple_blog/comment', 'token=' . $this->session->data['token'] . '&sort=sbc.name' . $url, 'SSL');
			$data['sort_status'] = $this->url->link('simple_blog/comment', 'token=' . $this->session->data['token'] . '&sort=sbc.status' . $url, 'SSL');
			$data['sort_date_added'] = $this->url->link('simple_blog/comment', 'token=' . $this->session->data['token'] . '&sort=sbc.date_added' . $url, 'SSL');
			
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
	
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
	
			$pagination = new Pagination();
			$pagination->total = $comment_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_admin_limit');
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('simple_blog/comment', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
	
			$data['pagination'] = $pagination->render();
			
            $data['results'] = sprintf($this->language->get('text_pagination'), ($comment_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($comment_total - $this->config->get('config_limit_admin'))) ? $comment_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $comment_total, ceil($comment_total / $this->config->get('config_limit_admin')));
            
			$data['sort'] = $sort;
			$data['order'] = $order;
            
            $data['header'] = $this->load->controller('common/header');
    		$data['column_left'] = $this->load->controller('common/column_left');
    		$data['footer'] = $this->load->controller('common/footer');
    
    		$this->response->setOutput($this->load->view('simple_blog/comment_list.tpl', $data));		
		}		

		public function getForm() {
			$data['heading_title'] = $this->language->get('heading_title');
			
            $data['text_form'] = !isset($this->request->get['simple_blog_comment_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');  
            
	    	$data['text_enabled'] = $this->language->get('text_enabled');
	    	$data['text_disabled'] = $this->language->get('text_disabled');
			
            $data['help_article'] = $this->language->get('help_article');
            
			$data['entry_author'] = $this->language->get('entry_author');
			$data['entry_article'] = $this->language->get('entry_article');
			$data['entry_status'] = $this->language->get('entry_status');
			$data['entry_comment'] = $this->language->get('entry_comment');
			$data['entry_reply_comment'] = $this->language->get('entry_reply_comment');
			
			$data['button_save'] = $this->language->get('button_save');
			$data['button_cancel'] = $this->language->get('button_cancel');
			$data['button_add_reply'] = $this->language->get('button_add_reply');
			$data['button_remove'] = $this->language->get('button_remove');
			
			$data['token'] = $this->session->data['token'];
			
			$data['tab_general'] = $this->language->get('tab_general');
			$data['tab_comment'] = $this->language->get('tab_comment');
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
			} else {
				$data['error_warning'] = '';
			}
	
	 		if (isset($this->error['article_title'])) {
				$data['error_article_title'] = $this->error['article_title'];
			} else {
				$data['error_article_title'] = '';
			}
			
			if (isset($this->error['author'])) {
				$data['error_author'] = $this->error['author'];
			} else {
				$data['error_author'] = '';
			}
			
		 	if (isset($this->error['comment'])) {
				$data['error_comment'] = $this->error['comment'];
			} else {
				$data['error_comment'] = '';
			}
			
			if (isset($this->error['reply_author'])) {
				$data['error_reply_author'] = $this->error['reply_author'];
			} else {
				$data['error_reply_author'] = array();
			}
			
			if (isset($this->error['reply_comment'])) {
				$data['error_reply_comment'] = $this->error['reply_comment'];
			} else {
				$data['error_reply_comment'] = array();
			}
			
			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$data['breadcrumbs'] = array();

	   		$data['breadcrumbs'][] = array(
	       		'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	      		'separator' => false
	   		);
	
	   		$data['breadcrumbs'][] = array(
	       		'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('simple_blog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL'),
	      		'separator' => ' :: '
	   		);
			
			if (!isset($this->request->get['simple_blog_comment_id'])) {
				$data['action'] = $this->url->link('simple_blog/comment/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
			} else {
				$data['action'] = $this->url->link('simple_blog/comment/update', 'token=' . $this->session->data['token'] . '&simple_blog_comment_id=' . $this->request->get['simple_blog_comment_id'] . $url, 'SSL');
			}
			
			$data['cancel'] = $this->url->link('simple_blog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
			if ((isset($this->request->get['simple_blog_comment_id'])) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
				$comment_info = $this->model_simple_blog_comment->getArticleComment($this->request->get['simple_blog_comment_id']);
			}
			
			if (isset($this->request->post['article_title'])) {
				$data['article_title'] = $this->request->post['article_title'];
			} elseif (isset($comment_info)) {
				$data['article_title'] = $comment_info['article_title'];
			} else {
				$data['article_title'] = '';
			}
			
			if (isset($this->request->post['author_name'])) {
				$data['author_name'] = $this->request->post['author_name'];
			} elseif (isset($comment_info)) {
				$data['author_name'] = $comment_info['author'];
			} else {
				$data['author_name'] = '';
			}
			
			if (isset($this->request->post['status'])) {
				$data['status'] = $this->request->post['status'];
			} elseif (isset($comment_info)) {
				$data['status'] = $comment_info['status'];
			} else {
				$data['status'] = 1;
			}
			
			if (isset($this->request->post['comment'])) {
				$data['comment'] = $this->request->post['comment'];
			} elseif (isset($comment_info)) {
				$data['comment'] = $comment_info['comment'];
			} else {
				$data['comment'] = '';
			}
			
			if (isset($this->request->post['comment_reply'])) {
				$data['comment_reply'] = $this->request->post['comment_reply'];
			} elseif (isset($this->request->get['simple_blog_comment_id'])) {
				$data['comment_reply'] = $this->model_simple_blog_comment->getCommentReply($this->request->get['simple_blog_comment_id']);
					
			} else {
				$data['comment_reply'] = array();
			}
			
            $data['header'] = $this->load->controller('common/header');
  		    $data['column_left'] = $this->load->controller('common/column_left');
            $data['footer'] = $this->load->controller('common/footer');
    
            $this->response->setOutput($this->load->view('simple_blog/comment_form.tpl', $data));			
		}

		public function validateForm() {
			
			if (!$this->user->hasPermission('modify', 'simple_blog/comment')) {
				$this->error['warning'] = $this->language->get('error_permission');
			}
			
			if(utf8_strlen($this->request->post['author_name']) < 3 || utf8_strlen($this->request->post['author_name']) > 64) {
				$this->error['author'] = $this->language->get('error_author');
			}

			if($this->request->post['article_title'] == '') {
				$this->error['article_title'] = $this->language->get('error_article_title');
			} else {
				$found = $this->model_simple_blog_comment->checkArticleTitle($this->request->post['article_title']);
				
				if(!$found) {
					$this->error['article_title'] = $this->language->get('error_article_title_not_found');
				}				
			}
			
			if(utf8_strlen($this->request->post['comment']) < 3 || utf8_strlen($this->request->post['comment']) > 1000) {
				$this->error['comment'] = $this->language->get('error_comment');
			}
			
			if(isset($this->request->post['comment_reply'])) {
				foreach($this->request->post['comment_reply'] as $key => $value) {
					if(utf8_strlen($value['author']) < 3 || utf8_strlen($value['author']) > 64) {
						$this->error['reply_author'][$key] = $this->language->get('error_author');
					}
					
					if(utf8_strlen($value['comment']) < 3 || utf8_strlen($value['comment']) > 1000) {
						$this->error['reply_comment'][$key] = $this->language->get('error_comment');
					}				
				}
			}			

			if($this->error && !isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_warning');
			}
			
			if (!$this->error) {
				return true;
			} else {
				return false;
			}		
		}

		private function validateDelete() {
			if (!$this->user->hasPermission('modify', 'simple_blog/comment')) {
				$this->error['warning'] = $this->language->get('error_permission');
			}
			
			if (!$this->error) {
				return true;
			} else {
				return false;
			}
		}
    }
?>