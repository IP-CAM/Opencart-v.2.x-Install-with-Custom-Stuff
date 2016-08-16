<?php
class ControllerCheckoutCouponCode extends Controller {
	public function index() {
		if ($this->config->get('coupon_status')) {
			$this->load->language('checkout/coupon');

			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_loading'] = $this->language->get('text_loading');

			$data['entry_coupon'] = $this->language->get('entry_coupon');

			$data['button_coupon'] = $this->language->get('button_coupon');

			if (isset($this->session->data['coupon'])) {
				$data['coupon'] = $this->session->data['coupon'];
			} else {
				$data['coupon'] = '';
			}

		/*	if (isset($this->request->get['redirect']) && !empty($this->request->get['redirect'])) {
				$data['redirect'] = $this->request->get['redirect'];
			} else {
				$data['redirect'] = $this->url->link('checkout/checkout');
			}*/

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/coupon_code.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/checkout/coupon_code.tpl', $data);
			} else {
				return $this->load->view('checkout/coupon_code.tpl', $data);
			}
		}
	}

	public function coupon() {
		$this->load->language('checkout/coupon');

		$json = array();

		$this->load->model('total/coupon');

		if (isset($this->request->post['coupon'])) {
			$coupon = $this->request->post['coupon'];
		} else {
			$coupon = '';
		}

		$coupon_info = $this->model_total_coupon->getCoupon($coupon);

		if (empty($this->request->post['coupon'])) {
			$json['error'] = 'Invalid Coupon Code or Expired';
		} elseif ($coupon_info) {
			$this->session->data['coupon'] = $this->request->post['coupon'];

			$this->session->data['success'] = 'Coupon Code Successfully Added';
			$json['success'] = "Coupon Code Successfully Added";

			/*$json['redirect'] = $this->url->link('checkout/checkout');*/
		} else {
			$json['error'] = 'Invalid Coupon Code or Expired';
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}