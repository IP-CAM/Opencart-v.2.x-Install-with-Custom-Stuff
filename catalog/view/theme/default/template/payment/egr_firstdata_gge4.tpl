<h2><?php echo $text_credit_card; ?></h2>
<div class="content" id="payment">
  <table class="form">
    <tr>
      <td><?php echo $entry_cc_name; ?></td>
      <td><input type="text" name="cc_name" value="" /></td>
    </tr>
    <tr>
      <td><?php echo $entry_cc_number; ?></td>
      <td><input type="text" name="cc_number" value="" /></td>
    </tr>
    <tr>
      <td><?php echo $entry_cc_expire_date; ?></td>
      <td> <select id="cc_month" name="cc_month">
            <option value="">-</option>
            <?php foreach ($exp_month as $month)
	    {?>
                <option value="<?php echo $month; ?>" ><?PHP echo $month;?></option>
	    <?php } ?>            
        </select>
    
        <select id="cc_year" name="cc_year">
            <option value="">-</option>
            <?php foreach ($exp_year as $year)
	    {?>
                <option value="<?php echo $year; ?>" ><?PHP echo $year;?></option>
	    <?php } ?>            
        </select></td>
    </tr>
    <tr>
      <td><?php echo $entry_cc_cvv; ?></td>
      <td><input type="text" name="cc_cvv" value="" size="4" maxlength="4" /></td>
    </tr>
  </table>
</div>
<div class="buttons">
  <div class="right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="button btn-auto" />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
	$.ajax({
		url: 'index.php?route=payment/egr_firstdata_gge4/send',
		type: 'post',
		data: $('#payment :input'),
		dataType: 'json',		
		beforeSend: function() {
			$('#button-confirm').attr('disabled', true);
			$('#payment').before('<div class="attention"><img src="catalog/view/theme/default/image/preload.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-confirm').attr('disabled', false);
			$('.attention').remove();
		},				
		success: function(json) {
			if (json['error']) {
				alert(json['error']);
			}
			if (json['success']) {
				location = json['success'];
			}
		}
	});
});
//--></script> 