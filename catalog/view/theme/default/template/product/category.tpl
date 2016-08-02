<?php echo $header; ?>
<div class="container-fluid category-page">

<ul class="breadcrumb">
<?php foreach ($breadcrumbs as $breadcrumb) { ?>
<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
<?php } ?>
</ul>

<div class="row">

<?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
<?php $class = 'col-sm-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php $class = 'col-sm-9'; ?>
<?php } else { ?>
<?php $class = 'col-sm-12'; ?>
<?php } ?>

<div id="content" class="col-md-10 col-md-offset-1 col-sm-12 category-content">

<?php echo $content_top; ?>

<h1><?php echo $heading_title; ?> Jerseys</h1>

<?php if ($products) { ?>

<div class="row">

<?php foreach ($products as $product) { ?>

<div class="product-layout product-grid col-lg-3 col-md-3 col-sm-4 col-xs-6">

<div class="product-thumb">

<div class="image">
<a href="<?php echo $product['href']; ?>">
<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
</a>
</div>

<div class="caption">

<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>

<?php if ($product['price']) { ?>
<p class="price">
<?php if (!$product['special']) { ?>
<?php echo $product['price']; ?>
<?php } else { ?>
<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
<?php } ?>
</p>
<?php } ?>

</div>

</div>

</div>

<?php } ?>

</div>

<div class="row">
<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
<div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>

<?php } ?>

<?php if (!$categories && !$products) { ?>
<div class="error-content category-empty">
<p class="text-center"><?php echo $text_empty; ?></p>
<div class="buttons text-center">
<a href="<?php echo $continue; ?>" class="button btn-main"><?php echo $button_continue; ?></a>
</div>
</div>
<?php } ?>

<?php echo $content_bottom; ?>

</div>

<?php echo $column_right; ?>

</div>

</div>
<?php echo $footer; ?>
