
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
<a href="" target="_blank"><i class="fa fa-twitter fa-5x" aria-hidden="true"></i></a>
<a href="" target="_blank"><i class="fa fa-instagram fa-5x" aria-hidden="true"></i></a>
</div>

<div class="footer-col footer-newsletter col-xs-12 col-sm-5 col-sm-pull-3">
<input type="text" name="newsletter-subscribe" value="" placeholder="Email" class="input-main input-subscribe" /><input type="submit" value="Subscribe" class="button btn-main" />
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

// variables
var menuButton = ".nav-option-btn",
	menu = ".nav-option-menu",
	searchMenu = ".nav-option-menu.search-menu",
	navMenu = ".nav-option-menu.nav-menu",
	cartMenu = ".nav-option-menu.cart-menu",
	currencyMainMenu = ".nav-option-menu.currency-menu-main",
	currencyMobileMenu = ".currency-menu-mobile",
	overlay = "body > .overlay",
	visible = ":visible",
	open = "open",
	close = "close",
	on = "on",
	off = "off",
	left = "left",
	right = "right";

// overlay on/off
function overlayAction(varOverlayAction){
	if (varOverlayAction === on) {
		$(overlay).show();
		$(overlay).animate({
			"opacity": ".5"
		});
	}
	if (varOverlayAction === off) {
		$(overlay).fadeOut();
		$(overlay).animate({
			"opacity": "0"
		});
	}
}
// check for corresponding menu 
function findMenu(varBtn,varMenu){
	return $(varBtn).parent().next(varMenu);
}
// find menu and open/close
function menuAction(varAction,varBtn1,varMenu1,varSide1){
	if (varAction === open) {
		findMenu(varBtn1,varMenu1).stop(true,true).show("slide", {direction: varSide1});
	}
	if (varAction === close) {
		findMenu(varBtn1,varMenu1).stop(true,true).hide("slide", {direction: varSide1});
	}
}
// open/close search menu
function searchAction(varSearchAction){
	if (varSearchAction === open) {
		$(searchMenu).slideDown();
	}
	if (varSearchAction === close) {
		$(searchMenu).slideUp();
	}
}
// close selected menu
function closeMenu(varMenu2,varSide2){
	$(varMenu2).stop(true,true).hide("slide", {direction: varSide2});
}

// navigation menus toggle
$(menuButton).click(function(){
	// check if button is active
	if ($(this).hasClass("btn-active")) {
		$(this).removeClass("btn-active");
	} else {
		$(menuButton).removeClass("btn-active");
		$(this).addClass("btn-active");
	}
	// check if corresponding menu is open
	if (findMenu(this,menu).is(visible)) {
		// check if open menu is the search menu
		if (findMenu(this,menu).is(searchMenu)) {
			searchAction(close);
			overlayAction(off);
		// check if open menu is the nav menu
		} else if (findMenu(this,menu).is(navMenu)) {
			closeMenu(navMenu,left);
			overlayAction(off);
		// check if open menu is either the cart menu or the main currency menu
		} else {
			menuAction(close,this,menu,right);
			overlayAction(off);
		}
	} else {
		// check if button clicked is the search menu button then close all other menus
		if ($(this).is(".search-btn")) {
			closeMenu(navMenu,left);
			closeMenu(currencyMainMenu,right);
			closeMenu(cartMenu,right);
			searchAction(open);
			overlayAction(on);
			$("nav .search-menu > .search-form > input[name='search']").focus();
		// check if button clicked is the nav menu button
		} else if ($(this).is(".nav-btn")) {
			// check if search menu is open then close search menu and open nav menu
			if ($(searchMenu).is(visible)) {
				searchAction(close);
				menuAction(open,this,navMenu,left);
				overlayAction(on);
			// check if cart menu is open then close cart menu and open nav menu
			} else {
				closeMenu(cartMenu,right);
				menuAction(open,this,navMenu,left);
				overlayAction(on);
			}
		// check if button clicked is the main currency menu button
		} else if ($(this).is(".currency-btn-main")) {
			// check if search menu is open then close search menu and open main currency menu
			if ($(searchMenu).is(visible)) {
				searchAction(close);
				menuAction(open,this,currencyMainMenu,right);
				overlayAction(on);
			// check if cart menu is open then close cart menu and open main currency menu
			} else {
				closeMenu(cartMenu,right);
				menuAction(open,this,currencyMainMenu,right);
				overlayAction(on);
			}
		// check if button clicked is the cart menu button
		} else {
			// check if search menu is open then close search menu and open cart menu
			if ($(searchMenu).is(visible)) {
				searchAction(close);
				menuAction(open,this,cartMenu,right);
				overlayAction(on);
			// check if main currency menu is open then close main currency menu and open cart menu
			} else if ($(currencyMainMenu).is(visible)) {
				closeMenu(currencyMainMenu,right);
				menuAction(open,this,cartMenu,right);
				overlayAction(on);
			// check is nav menu is open then close nav menu and open cart menu
			} else  {
				closeMenu(navMenu,left);
				menuAction(open,this,cartMenu,right);
				overlayAction(on);
			}
		}
	}
	// check if mobile currency menu is open
	if ($(currencyMobileMenu).is(visible)) {
		$(currencyMobileMenu).slideUp();
	}
});

// mobile currency menu toggle
$(".currency-btn-mobile").click(function(){
	if ($(currencyMobileMenu).is(visible)) {
		$(currencyMobileMenu).slideUp();
	} else {
		$(currencyMobileMenu).slideDown();
	}
});

// overlay click event
$(overlay).click(function(){
	$(menuButton).removeClass("btn-active");
	if ($(searchMenu).is(visible)) {
		searchAction(close);
		overlayAction(off);
	} else {
		$(menu).stop(true,true).hide("slide", {direction: "right"});
		overlayAction(off);
	}
});

// add/remove overlay on resize (if nec.)
$(window).resize(function(){
if (!($(menu).is(visible)) && ($(overlay).is(visible))) {
	overlayAction(off);
}
if (($(menu).is(visible)) && !($(overlay).is(visible))) {
	overlayAction(on);
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

// product color option
$(".product-options .image-option .radio").click(function(){
	if ($(".product-options .image-option .radio label input[type=radio]").is(":checked")){
		$(this).find("img").css("border", "solid 2px #58595B");
	}
	$(".product-options .image-option .radio").not(this).each(function(){
		$(this).find("img").css("border", "solid 2px transparent");
	});
});

// floating banner
var bannerFloat = ".banner-float";
$(document).ready(function(){
function checkOffset() {
	if ($(bannerFloat).offset().top + $(bannerFloat).height() >= $('footer').offset().top) {
		$(bannerFloat).css({
			'position': 'relative',
			'bottom': '0px'
		});
	}
	if ($(document).scrollTop() + window.innerHeight < $('footer').offset().top) {
		$(bannerFloat).css({
			'position': 'fixed',
			'bottom': '0px'
		}); // restore when you scroll up
	}
}
$(document).scroll(function(){
checkOffset();
});
});
</script>

</body>
</html>