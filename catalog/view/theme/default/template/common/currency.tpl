
<li class="currency-item">
<button type="button" class="nav-option-btn currency-btn">
<?php foreach ($currencies as $currency) { ?>
<?php if ($currency['code'] == $code) { ?>
<strong><?php echo $currency['code']; ?></strong>
<?php } ?>
<?php } ?>
<i class="fa fa-caret-down"></i>
</button>
</li>

<?php if (count($currencies) > 1) { ?>
<div class="nav-option-menu currency-menu" style="display:none;">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">

<ul>
<?php foreach ($currencies as $currency) { ?>
<?php if ($currency['symbol_left']) { ?>
<li><button class="currency-select btn-block" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?><?php echo $currency['code']; ?></button></li>
<?php } else { ?>
<li><button class="currency-select btn btn-block" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['code']; ?><?php echo $currency['symbol_right']; ?></button></li>
<?php } ?>
<?php } ?>
</ul>

<input type="hidden" name="code" value="" />
<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />

</form>
</div>
<?php } ?>
