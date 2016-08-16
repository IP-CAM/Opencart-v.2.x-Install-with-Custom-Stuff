      <p class="coupon-title">Use a coupon code:</p>
	  <label class="col-sm-2 control-label" for="input-coupon"><?php echo $entry_coupon; ?></label>
      <div class="input-group coupon-group">
        <input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="Coupon Code" id="input-coupon" class="form-control" />
        <span class="input-group-btn coupon-btn">
        <input type="button" value="<?php echo $button_coupon; ?>" id="button-coupon" data-loading-text="<?php echo $text_loading; ?>"  class="btn-coupon" />
        </span></div>
      <script type="text/javascript"><!--
$('#button-coupon').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/coupon_code/coupon',
		type: 'post',
		data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
		dataType: 'json',
		beforeSend: function() {
			$('#button-coupon').button('loading');
		},
		complete: function() {
			$('#button-coupon').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				 $('#collapse-shipping-method .panel-body').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				//$('html, body').animate({ scrollTop: 0 }, 'slow');
			}

			if (json['success']) {
				 $('#collapse-shipping-method .panel-body').prepend('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

			}
		}
	});
});
//--></script>
