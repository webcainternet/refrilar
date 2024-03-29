<?php
class ControllerModuleTmSlideshow extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		$this->document->addScript('catalog/view/javascript/camera/camera.js');
		$this->document->addStyle('catalog/view/javascript/camera/css/camera.css');

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'description' => html_entity_decode($result['description']),
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

		$data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/tm_slideshow.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/tm_slideshow.tpl', $data);
		} else {
			return $this->load->view('default/template/module/tm_slideshow.tpl', $data);
		}
	}
}