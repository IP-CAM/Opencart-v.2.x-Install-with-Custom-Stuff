<?php
class ControllerCommonSearchHome extends Controller {
	public function index() {
		$this->load->language('common/search');

		$data['text_search'] = $this->language->get('text_search');
		$data['title_search'] = $this->language->get('title_search');

		if (isset($this->request->get['search'])) {
			$data['search'] = $this->request->get['search'];
		} else {
			$data['search'] = '';
		}

		return $this->load->view('common/search_home', $data);
	}
}