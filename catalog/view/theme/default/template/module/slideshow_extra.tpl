
<style>
/* OWL CAROUSEL
.owl-carousel {
margin:0 0 50px;
}
.owl-wrapper-outer {
border:none;
-webkit-border-radius:0;
-moz-border-radius:0;
-o-border-radius:0;
border-radius:0;
-webkit-box-shadow:none;
-moz-box-shadow:none;
-o-box-shadow:none;
box-shadow:none;
}
.owl-wrapper {
margin-bottom:50px;
}
.owl-item {
position:relative;
}
.slider-overlay {
position:absolute;
top:0;
bottom:50px;
width:33.333%;
background:#000;
opacity:.25;
}
.slider-overlay:nth-child(1){
left:0;
}
.slider-overlay:nth-child(2){
display:none;
}
.slider-overlay:nth-child(3){
right:0;
}
OWL CAROUSEL */
</style>

<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 3,
	autoPlay: false,
	singleItem: false,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: false,
	addClassActive: true,
	afterAction: true
});

$(".slideshow .owl-wrapper-outer").append("<span class=\"slider-overlay\"></span><span class=\"slider-overlay\"></span><span class=\"slider-overlay\"></span>");
--></script>