<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/jquery-ui-1.11.4.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet" media="screen" />
<link href="catalog/view/javascript/jquery/slick/slick.css" rel="stylesheet" media="screen" />
<link href="catalog/view/javascript/jquery/slick/slick-theme.css" rel="stylesheet" media="screen" />

<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/slick/slick.min.js" type="text/javascript"></script>

<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">

<div class="loader"></div>

<header id="header" class="header">

<!-- MAIN NAV -->
<nav id="nav" class="nav nav-main">

<div class="nav-container">

<div class="nav-logo">
<a href="<?php echo $home; ?>"><?php echo $name; ?></a>
</div>

<div class="nav-content">

<?php if ($categories) { ?>
<ul class="nav-menu">
<?php foreach ($categories as $category) { ?>
<li><a href="<?php echo $category["href"]; ?>"><?php echo $category["name"]; ?></a></li>
<?php } ?>
</ul>
<?php } ?>

<ul class="nav-options">
<li><button type="button" class="nav-option-btn search-btn"><i class="fa fa-search"></i></button></li>
<?php echo $search; ?>

<li>
<button type="button" class="nav-option-btn currency-btn-main">
<?php foreach ($currencies as $currency) { ?>
<?php if ($currency['code'] == $code) { ?>
<strong><?php echo $currency['code']; ?></strong>
<?php } ?>
<?php } ?>
<i class="fa fa-caret-down"></i>
</button>
</li>

<?php if (count($currencies) > 1) { ?>
<div class="nav-option-menu currency-menu-main" style="display:none;">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">

<ul>
<?php foreach ($currencies as $currency) { ?>
<?php if ($currency['symbol_left']) { ?>
<li><button class="currency-select" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?><?php echo $currency['code']; ?></button></li>
<?php } else { ?>
<li><button class="currency-select" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['code']; ?><?php echo $currency['symbol_right']; ?></button></li>
<?php } ?>
<?php } ?>
</ul>

<input type="hidden" name="code" value="" />
<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />

</form>
</div>
<?php } ?>

<?php echo $cart; ?>
</ul>

</div>

</div>

</nav>

<!-- MOBILE NAV -->
<nav id="nav" class="nav nav-mobile">

<div class="nav-container">

<div class="nav-toggle">
<button type="button" class="nav-option-btn nav-btn"><i class="fa fa-bars"></i></button>
</div>

<?php if ($categories) { ?>
<ul class="nav-option-menu nav-menu">
<?php foreach ($categories as $category) { ?>
<li><a href="<?php echo $category["href"]; ?>"><?php echo $category["name"]; ?></a></li>
<?php } ?>

<li>
<button type="button" class="currency-btn-mobile">
<?php foreach ($currencies as $currency) { ?>
<?php if ($currency['code'] == $code) { ?>
<strong><?php echo $currency['code']; ?></strong>
<?php } ?>
<?php } ?>
<i class="fa fa-caret-down"></i>
</button>
</li>

<?php if (count($currencies) > 1) { ?>
<div class="currency-menu-mobile" style="display:none;">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">

<ul>
<?php foreach ($currencies as $currency) { ?>
<?php if ($currency['symbol_left']) { ?>
<li><button class="currency-select" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?><?php echo $currency['code']; ?></button></li>
<?php } else { ?>
<li><button class="currency-select" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['code']; ?><?php echo $currency['symbol_right']; ?></button></li>
<?php } ?>
<?php } ?>
</ul>

<input type="hidden" name="code" value="" />
<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />

</form>
</div>
<?php } ?>

</ul>
<?php } ?>

<div class="nav-logo">
<a href="<?php echo $home; ?>"><?php echo $name; ?></a>
</div>

<div class="nav-content">

<ul class="nav-options">
<li><button type="button" class="nav-option-btn search-btn"><i class="fa fa-search"></i></button></li>
<?php echo $search; ?>
<?php echo $cart; ?>
</ul>

</div>

</div>

</nav>

</header>

<div class="overlay"></div>
