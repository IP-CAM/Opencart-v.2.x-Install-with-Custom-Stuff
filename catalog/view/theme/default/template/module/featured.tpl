
<div class="featured-section">
<h1><?php echo $heading_title; ?></h1>
<div class="row">
<?php foreach ($products as $product) { ?>
<div class="product-layout col-lg-3 col-md-4 col-sm-4 col-xs-6">
<div class="product-thumb transition">
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
</div>