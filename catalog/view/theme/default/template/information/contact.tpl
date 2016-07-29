<?php echo $header; ?>
<div class="container contact-page">
<ul class="breadcrumb">
<?php foreach ($breadcrumbs as $breadcrumb) { ?>
<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
<?php } ?>
</ul>
<div class="row">

<div id="content" class="col-sm-8 col-sm-offset-2 contact-content">

<?php echo $content_top; ?>

<h1 style="margin-top:75px;margin-bottom:75px;font-weight:bold;text-align:center;"><?php echo $heading_title; ?></h1>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">

<fieldset>

<div class="form-group required">
<!--<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>-->
<div class="col-sm-12">
<input type="text" name="name" value="<?php echo $name; ?>" placeholder="Your Name" id="input-name" class="form-control" />
<?php if ($error_name) { ?>
<div class="text-danger"><?php echo $error_name; ?></div>
<?php } ?>
</div>
</div>

<div class="form-group required">
<!--<label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>-->
<div class="col-sm-12">
<input type="text" name="email" value="<?php echo $email; ?>" placeholder="Your Email" id="input-email" class="form-control" />
<?php if ($error_email) { ?>
<div class="text-danger"><?php echo $error_email; ?></div>
<?php } ?>
</div>
</div>

<div class="form-group required">
<!--<label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>-->
<div class="col-sm-12">
<textarea name="enquiry" rows="10" placeholder="Your Inquiry" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
<?php if ($error_enquiry) { ?>
<div class="text-danger"><?php echo $error_enquiry; ?></div>
<?php } ?>
</div>
</div>

<?php echo $captcha; ?>

</fieldset>

<div class="buttons">
<div class="">
<input class="submit-btn" type="submit" value="<?php echo $button_submit; ?>" />
</div>
</div>

</form>

<?php echo $content_bottom; ?>

</div>

</div>

</div>
<?php echo $footer; ?>
