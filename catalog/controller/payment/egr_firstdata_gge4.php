<?php

class ControllerPaymentEgrFirstDataGGE4 extends Controller {

    public function index() {
        $this->language->load('payment/egr_firstdata_gge4');

        $data['text_credit_card'] = $this->language->get('text_credit_card');
        $data['text_wait'] = $this->language->get('text_wait');

        $data['entry_cc_name'] = $this->language->get('entry_cc_name');
        $data['entry_cc_number'] = $this->language->get('entry_cc_number');
        $data['entry_cc_expire_date'] = $this->language->get('entry_cc_expire_date');
        $data['entry_cc_cvv'] = $this->language->get('entry_cc_cvv');

        $data['exp_month'] = $this->cardMonths();
        $data['exp_year'] = $this->cardYears();

        $data['button_confirm'] = $this->language->get('button_confirm');

        // if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/egr_firstdata_gge4.tpl')) {
        //     return $this->load->view($this->config->get('config_template') . '/template/payment/egr_firstdata_gge4.tpl', $data);
        // } else {
            return $this->load->view('payment/egr_firstdata_gge4.tpl', $data);
        // }

        //$this->render();	
    }

    function egrfirstdatae4_cvv_response($cvv) {
        $cardcvv = trim($cvv);
        switch ($cardcvv) {
            case 'M':
                return 'Card is authentic';
            case 'N':
                return 'CVV2 does not match';
            case 'P':
                return 'Card expiration not provided or card does not have valid CVD code';
            case 'S':
                return 'Merchant indicated that CVV2 is not present on card';
            case 'U':
                return 'Card issuer is not certified and/or has not provided visa encryption keys';
            default:
                return 'Unknown response';
        }
    }

    function egrfirstdatae4_avs_response($avs) {
        $cardavs = trim($avs);
        switch ($cardavs) {
            case 'X':
                return 'Exact match, 9 digit zip - Street Address, and 9 digit ZIP Code match';
            case 'Y':
                return 'Exact match, 5 digit zip - Street Address, and 5 digit ZIP Code match';
            case 'A':
                return 'Partial match - Street Address matches, ZIP Code does not';
            case 'W':
                return 'Partial match - ZIP Code matches, Street Address does not';
            case 'Z':
                return 'Partial match - 5 digit ZIP Code match only';
            case 'N':
                return 'No match - No Address or ZIP Code match';
            case 'U':
                return 'Address information is unavailable for that account number, or the card issuer does not support';
            case 'G':
                return 'Service Not supported, non-US Issuer does not participate';
            case 'R':
                return 'Retry - Issuer system unavailable, retry later';
            case 'E':
                return 'Not a mail or phone order';
            case 'S':
                return 'Service not supported';
            case 'Q':
                return 'Bill to address did not pass edit checks';
            case 'D':
                return 'International street address and postal code match';
            case 'B':
                return 'International street address match, postal code not verified due to incompatable formats';
            case 'C':
                return 'International street address and postal code not verified due to incompatable formats';
            case 'P':
                return 'International postal code match, street address not verified due to incompatable format';
            case '1':
                return 'Cardholder name matches';
            case '2':
                return 'Cardholder name, billing address, and postal code match';
            case '3':
                return 'Cardholder name and billing postal code match';
            case '4':
                return 'Cardholder name and billing address match';
            case '5':
                return 'Cardholder name incorrect, billing address and postal code match';
            case '6':
                return 'Cardholder name incorrect, billing postal code matches';
            case '7':
                return 'Cardholder name incorrect, billing address matches';
            case '8':
                return 'Cardholder name, billing address, and postal code are all incorrect';
            default:
                return 'Unknown Response';
        }
    }

    function cardMonths() {
        for ($i = 01; $i < 13; $i++)
            $tab[] = sprintf("%02d", $i);
        return $tab;
    }

    function cardYears() {
        for ($i = date('y'); $i < (date('y') + 11); $i++)
            $tab[] = $i;
        return $tab;
    }

    function egrff_validate_card_number($card_number) {
        $card_number = preg_replace('[^0-9]', '', $card_number);
        if ($card_number < 9)
            return false;
        $card_number = strrev($card_number);
        $total = 0;
        for ($i = 0; $i < strlen($card_number); $i++) {
            $current_number = substr($card_number, $i, 1);
            if ($i % 2 == 1) {
                $current_number *= 2;
            }
            if ($current_number > 9) {
                $first_number = $current_number % 10;
                $second_number = ($current_number - $first_number) / 10;
                $current_number = $first_number + $second_number;
            }
            $total += $current_number;
        }
        return ($total % 10 == 0);
    }

    public function send() {

        $curExp = 1;
        $cardExp = 1;
        $json = array();
        $this->load->model('checkout/order');
        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
        $entry_error = array();

        $cardName = trim($this->request->post['cc_name']);
        if (empty($cardName))
            $entry_error[] = 'The name as it appears on the card is required';

        $cardNumber = trim($this->request->post['cc_number']);

        if (empty($cardNumber)) {
            $entry_error[] = 'The credit card number is required';
        } else {

            if (!is_numeric($cardNumber)) {
                $entry_error[] = 'Card Number not valid';
            } else {


                if ($this->egrff_validate_card_number($cardNumber) == false)
                    $entry_error[] = 'Card Number not valid';
            }
        }


        $cardCode = trim($this->request->post['cc_cvv']);
        if (empty($cardCode))
            $entry_error[] = 'The cvn on the back of the credit card is required';
        $expMonth = trim($this->request->post['cc_month']);

        if (empty($expMonth))
            $entry_error[] = 'The month your credit card expires is required';
        $expYear = trim($this->request->post['cc_year']);

        if (empty($expYear))
            $entry_error[] = 'The year your credit card expires is required';


        if (!empty($expMonth) && !empty($expYear)) {
            $cardExpires = $expMonth . "/" . $expYear;
            $cardExp = ($expYear . $expMonth) * 1;
            $curExp = date('ym') * 1;
        }

        if ($cardExp < $curExp)
            $entry_error[] = 'card expiry date is invalid';

        if (!isset($this->session->data['order_id'])) {
            $this->session->data['order_id'] = "";
        }

        $customer_id = $order_info['customer_id'];
        $customer_email = $order_info['email'];
        $transactionType = urlencode($this->config->get('egr_firstdata_gge4_transaction'));
        $cardholder_name = urlencode($cardName);
        $card_number = urlencode($cardNumber);
        $card_expire = urlencode($expMonth) . urlencode($expYear);
        $cvv2Number = urlencode($cardCode);
        $currencyCode = $order_info['currency_code'];
        $amount = $order_info['total'];

        $trxnProperties = array(
            "User_Name" => $this->config->get('egr_firstdata_gge4_username'),
            "gateway_id" => $this->config->get('egr_firstdata_gge4_gateway_id'),
            "password" => $this->config->get('egr_firstdata_gge4_password'),
            "ecommerce_flag" => "0",
            "xid" => "",
            "cavv" => "",
            "cavv_algorithm" => "",
            "transaction_type" => $transactionType,
            "reference_no" => intval($this->session->data['order_id']),
            "customer_ref" => $customer_id,
            "reference_3" => "",
            "client_ip" => $_SERVER["REMOTE_ADDR"],
            "client_email" => $customer_email,
            "language" => "en",
            "cc_number" => $card_number,
            "cc_expiry" => $card_expire,
            "cardholder_name" => $cardholder_name,
            "track1" => "",
            "track2" => "",
            "transaction_tag" => "",
            "authorization_num" => "",
            "amount" => $amount,
            "currency" => $currencyCode,
            "cc_verification_str1" => $order_info['payment_address_1'] . "|" . $order_info['payment_city'],
            "cc_verification_str2" => $cvv2Number,
            "cvd_presence_ind" => "",
            "secure_auth_required" => "",
            "partial_redemption" => "",
            "zip_code" => $order_info['payment_postcode'],
            "tax1_amount" => "",
            "tax1_number" => "",
            "tax2_amount" => "",
            "tax2_number" => "",
            "pan" => ""
        );

        if (!function_exists('curl_init'))
            $entry_error[] = 'Curl function not found.';
        if (!is_numeric($amount) || $amount <= 0)
            $entry_error[] = 'Amount is not valid';
        if ($this->config->get('egr_firstdata_gge4_sandbox') == 'Live')
            $submiturl = 'https://api.globalgatewaye4.firstdata.com/transaction/v11';
        else
            $submiturl = 'https://api.demo.globalgatewaye4.firstdata.com/transaction/v11';


        $data_string = json_encode($trxnProperties);

        $ch = curl_init($submiturl);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_TIMEOUT, 45);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=UTF-8;', 'Accept: application/json'));

        $a = curl_error($ch);

        // Getting results
        $result = curl_exec($ch);
        $trxnResult = json_decode($result);
        if (count($entry_error) <= 0) {

            if ($trxnResult) {

                if ($trxnResult->bank_resp_code == '100') {

                  //  $this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('config_order_status_id'));
                    $message = '';

                    $order_id = $this->session->data['order_id'];
                    $transaction_type = $trxnResult->transaction_type;
                    $transaction_tag = $trxnResult->transaction_tag;
                    $authorization_num = $trxnResult->authorization_num;
                    $bank_response_code = $trxnResult->bank_resp_code;
                    $bank_response_msg = $trxnResult->bank_message;
                    $transaction_amount = $trxnResult->amount;
                    $client_ip = $trxnResult->client_ip;
                    
                    
                  if(isset($trxnResult->avs))
                    $avs = $this->egrfirstdatae4_avs_response($trxnResult->avs);
                    else
                    $avs = "";
			
                if(isset($trxnResult->cvv2))
                    $cvv = $this->egrfirstdatae4_cvv_response($trxnResult->cvv2);
                    else
                    $cvv = "";
                    
                    $ctr = $trxnResult->ctr;

                    $message = '<b>Transaction Tag:&nbsp;</b>' . $transaction_tag . '<br />
				    <b>Authorization Num:&nbsp;</b>' . $authorization_num . '<br />
				    <b>Transaction Type:&nbsp;</b>' . $transaction_type . '<br />
				    <b>Bank Message:&nbsp;</b>' . $bank_response_msg . '<br />
				    <b>Amount:&nbsp;</b>' . $this->currency->format($transaction_amount, $order_info['currency_code'], false, false) . '<br/>
				    <b>AVS response:&nbsp;</b>' . $avs;

                //    $this->model_checkout_order->update($this->session->data['order_id'], $this->config->get('egr_fd_gge4_os_id'), $message, false);
                    
                    
                    $this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('egr_firstdata_gge4_os_id'),$message, false);

                    $this->load->model('payment/egr_firstdata_gge4');

                    $order_entry = $this->model_payment_egr_firstdata_gge4->order($order_id, $transaction_type, $transaction_tag, $authorization_num, $transaction_amount, $bank_response_code, $bank_response_msg, $ctr);

                    $json['success'] = $this->url->link('checkout/success');
                } else {
                    $message = 'Cannot process the payment, please try again or contact the site administrator for support';
                    if ($trxnResult->Bank_Resp_Code == '' || $trxnResult->Bank_Resp_Code == '00') {
                        $errors = $trxnResult->EXact_Message . ' (' . $trxnResult->EXact_Resp_Code . ')';
                        $message = 'Card payment declined: ' . $errors;
                        return $message;
                    }
                    $json['error'] = $message;
                }
            } else {
                $message = 'Cannot process the payment, please try again or contact the site administrator for support';
                $json['error'] = $message;
            }
        } else {
            $message = '';
            foreach ($entry_error as $err) {
                $message.="*" . $err . "\n";
            }
            $json['error'] = $message;
        }
   
        $this->response->setOutput(json_encode($json));
    }

}

?>