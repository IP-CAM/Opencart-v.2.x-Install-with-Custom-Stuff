<?php echo $header; ?>
<?php echo $content_top; ?>
<div class="container-fluid">
	<div class="row">
		<?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="home-content col-md-10 col-md-offset-1 col-sm-12">
			<?php echo $content_bottom; ?>
			<?php echo $search_home; ?>
		</div>
		<?php echo $column_right; ?>
	</div>
</div>
<?php echo $footer; ?>