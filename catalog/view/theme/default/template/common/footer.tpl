
<div class="banner-float">
<p>FREE SHIPPING! IT'S LIT!</p>
</div>

<footer>
<div class="container-fluid">
<div class="row">

<!--
<h5><?php echo $text_account; ?></h5>
<ul class="list-unstyled">
<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
</ul>
-->

<div class="footer-col footer-social col-xs-12 col-sm-3 col-sm-push-5">
<a href=""><i class="fa fa-twitter fa-5x" aria-hidden="true"></i></a>
<a href=""><i class="fa fa-instagram fa-5x" aria-hidden="true"></i></a>
</div>

<div class="footer-col footer-newsletter col-xs-12 col-sm-5 col-sm-pull-3">
<h1 style="margin:0;">NEWSLETTER</h1>
</div>

<div class="footer-col footer-nav col-xs-6 col-sm-2">
<?php if ($categories) { ?>
<h3><?php echo $text_categories; ?></h3>
<ul class="list-unstyled">
<?php foreach ($categories as $category) { ?>
<li><a href="<?php echo $category["href"]; ?>"><?php echo $category["name"]; ?></a></li>
<?php } ?>
</ul>
<?php } ?>
</div>

<div class="footer-col footer-info col-xs-6 col-sm-2">
<?php if ($informations) { ?>
<h3><?php echo $text_about; ?></h3>
<ul class="list-unstyled">
<?php foreach ($informations as $information) { ?>
<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
<?php } ?>
<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
</ul>
<?php } ?>
</div>

</div>
<p class="copyright" style="text-align:center;"><?php echo $text_copyright; ?></p>
</div>
</footer>

<script>

$(window).load(function() {
	$(".loader").fadeOut("slow");
});

function overlayOn(){
$("body > .overlay").show();
$("body > .overlay").animate({
	"opacity": ".5"
});
}

function overlayOff(){
$("body > .overlay").fadeOut();
$("body > .overlay").animate({
	"opacity": "0"
});
}

// navigation menus toggle
$(".nav-option-btn").click(function(){
	if ($(this).hasClass("btn-active")) {
		$(this).removeClass("btn-active");
	} else {
		$(".nav-option-btn").removeClass("btn-active");
		$(this).addClass("btn-active");
	}
	if ($(this).parent().next("nav .nav-option-menu").is(":visible")) {
		if ($(this).parent().next("nav .nav-option-menu").is(".search-menu")) {
			$("nav .nav-option-menu.search-menu").slideUp();
			overlayOff();
		} else {
			$(this).parent().next("nav .nav-option-menu").stop(true,true).hide("slide", {direction: "right"});
			overlayOff();
		}
	} else {
		if ($(this).is(".search-btn")) {
			$("nav .nav-option-menu").stop(true,true).hide("slide", {direction: "right"});
			$("nav .nav-option-menu.search-menu").slideDown();
			overlayOn();
			$("nav .search-menu > .search-form > input[name='search']").focus();
		} else {
			if ($("nav .nav-option-menu.search-menu").is(":visible")) {
				$("nav .nav-option-menu.search-menu").slideUp();
				$(this).parent().next("nav .nav-option-menu").stop(true,true).show("slide", {direction: "right"});
				overlayOn();
			} else {
				$("nav .nav-option-menu").stop(true,true).hide("slide", {direction: "right"});
				$(this).parent().next("nav .nav-option-menu").stop(true,true).show("slide", {direction: "right"});
				overlayOn();
			}
		}
	}
	if ($(".currency-menu-mobile").is(":visible")) {
		$(".currency-menu-mobile").slideUp();
	}
});

// overlay click event
$("body > .overlay").click(function(){
	$(".nav-option-btn").removeClass("btn-active");
	if ($("nav .nav-option-menu.search-menu").is(":visible")) {
		$("nav .nav-option-menu.search-menu").slideUp();
		overlayOff();
	} else {
		$("nav .nav-option-menu").stop(true,true).hide("slide", {direction: "right"});
		overlayOff();
	}
});

// add/remove overlay on resize (if nec)
$(window).resize(function(){
if (!($(".nav-option-menu").is(":visible")) && ($("body > .overlay").is(":visible"))) {
	overlayOff();
}
if (($(".nav-option-menu").is(":visible")) && !($("body > .overlay").is(":visible"))) {
	overlayOn();
}
});

// mobile currency menu toggle
$(".currency-btn-mobile").click(function(){
	if ($(".currency-menu-mobile").is(":visible")) {
		$(".currency-menu-mobile").slideUp();
	} else {
		$(".currency-menu-mobile").slideDown();
	}
});

// small screen clearfix for product grid

$(window).on("load resize", function(){
	var width = $(window).width();
	if ((width < 400) && (!$(".clearfix.product-clear").length)) {
		$(".product-layout:nth-child(2n)").after("<div class=\"clearfix product-clear\"></div>");
	} else {
		$(".product-layout + .clearfix").remove();
	}
});


// product color test
$(".product-options .image-option .radio").click(function(){
if ($(".product-options .image-option .radio label input[type=radio]").is(":checked")){
	$(this).find("img").css("border", "solid 1px #000");
}
$(".product-options .image-option .radio").not(this).each(function(){
	$(this).find("img").css("border", "solid 1px transparent");
});
});

// floating banner
function checkOffset() {
	if ($('.banner-float').offset().top + $('.banner-float').height() >= $('footer').offset().top) {
		$('.banner-float').css({
			'position': 'relative',
			'bottom': '-51px'
		});
	}
	if ($(document).scrollTop() + window.innerHeight < $('footer').offset().top) {
		$('.banner-float').css({
			'position': 'fixed',
			'bottom': '0px'
		}); // restore when you scroll up
	}
}
$(window).on('load, resize, scroll', function() {
	checkOffset();
});

</script>

</body>
</html>