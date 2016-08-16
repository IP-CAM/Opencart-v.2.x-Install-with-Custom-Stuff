<?php 
class ModelPaymentEgrFirstdataGGE4 extends Model {
  	public function getMethod($address, $total) { 
		$this->load->language('payment/egr_firstdata_gge4');
		
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone_to_geo_zone` WHERE geo_zone_id = '" . (int)$this->config->get('egr_fd_gge4_geo') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
		
		if ($this->config->get('egr_fd_gge4_total') > $total) {
			$status = false;
		} elseif (!$this->config->get('egr_fd_gge4_geo')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}	
		
		$method_data = array();
	
		if ($status) {  
      		$method_data = array( 
        		'code'       => 'egr_firstdata_gge4',
        		'title'      => $this->language->get('text_title'),
			'terms'           =>'',
			'sort_order' => $this->config->get('egr_fd_gge4_sort')
      		);
    	}
   
    	return $method_data;
  	}
	public function order($orderid, $transaction_type, $transaction_tag,$authorization_num,$transaction_amount, $bank_response_code, $bank_response_msg,$ctr) {

		$query =  $this->db->query("INSERT INTO `" . DB_PREFIX . "firstdata_gge4_order` SET
					   order_id = '" . $this->db->escape($orderid) . "',
					   transaction_type = '" . $transaction_type . "',
					   transaction_tag= '" . $transaction_tag . "',
					   authorization_num= '" . $authorization_num. "' ,
					   transaction_amount= '" . $transaction_amount. "' ,
					   bank_response_code= '" . $bank_response_code. "',
					   bank_response_msg= '" . $bank_response_msg. "',
					   ctr= '" . $ctr. "'
					   ");
		
		return $query;
	}

}
?>