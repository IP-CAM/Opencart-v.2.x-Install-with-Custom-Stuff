<style>
.slide-container {
margin-bottom:50px;
padding-left:35px;
padding-right:35px;
}

.slide-inner {
position:absolute;
top:0;
left:0;
width:100%;
height:100%;
}

.slick-slide {
position:relative;
margin-bottom:40px;
}

.slick-slide img {
width:100%;
}

.banner-title {
position:absolute;
bottom:0;
left:0;
right:0;
width:88%;
height:80px;
margin:0 auto;
padding:0;
line-height:80px;
text-align:center;
background:rgba(35,31,32,.9);
color:#fff;
font-family:'GothamBold';
font-size:36px;
text-transform:uppercase;
opacity:0;
transform:translateY(50%);
transition:all .5s;
-webkit-transition:all .5s;
}

.slideshow .slick-slide .slide-inner {
background:rgba(35,31,32,.3);
transition: all 300ms ease;
}

.slideshow .slick-slide.slick-center .slide-inner {
background:transparent;
}

.slick-slide.slick-active:hover .banner-title,
.slick-slide.slick-current.slick-active.slick-center:hover .banner-title {
opacity:1;
transition:all .5s;
-webkit-transition:all .5s;
}

/* css arrows */
.slick-prev:before, .slick-next:before {
content:none;
}

.slick-prev, .slick-next {
color:#231F20;
z-index:2;
}

.slick-prev, .slick-prev:active, .slick-prev:focus {
width:10px;
height:20px;
margin-top:-15px;
border-top: 10px solid transparent;
border-bottom: 10px solid transparent; 
border-right:10px solid #231F20;
}

.slick-next, .slick-next:active, .slick-next:focus {
width:10px;
height:20px;
margin-top:-15px;
border-top: 10px solid transparent;
border-bottom: 10px solid transparent;
border-left: 10px solid #231F20;
}

@media (max-width:991px) {
.slideshow .slick-slide .slide-inner {
background:transparent;
}
}


@media (max-width:767px){

.slide-container {
padding-left:0;
padding-right:0;
}

.slide-container > .col-sm-12 {
padding-left:0;
padding-right:0;
}

.slideshow .slick-slide .slide-inner {
background:transparent;
}

.slick-slide .banner-title {
opacity:1;
transition:all .5s;
-webkit-transition:all .5s;
}

.banner-title {
height:60px;
line-height:60px;
font-size:24px;
}

.slick-prev {
left:15px;
}

.slick-next {
right:15px;
}

}

@media (max-width:600px){

.slideshow-container {
padding-left:0;
padding-right:0;
}

.slideshow-container > .col-sm-12 {
padding-left:0;
padding-right:0;
}

}
</style>

<div class="container-fluid slide-container">
<div class="col-sm-12">
<div id="slideshow<?php echo $module; ?>" class="slideshow" style="opacity: 1;">
<?php foreach ($banners as $banner) { ?>
<div class="slide">
<?php if ($banner['link']) { ?>
<a href="<?php echo $banner['link']; ?>">
<div class="slide-inner"></div>
<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
<p class="banner-title"><?php echo $banner['title']; ?></p>
</a>
<?php } else { ?>
<div class="slide-inner"></div>
<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
<p class="banner-title"><?php echo $banner['title']; ?></p>
<?php } ?>
</div>
<?php } ?>
</div>
</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
$('.slideshow').slick({
infinite: true,
arrows: true,
prevArrow: '<button type="button" class="slick-prev">Previous</button>',
centerMode: true,
centerPadding: '0',
slidesToShow: 3,
slidesToScroll: 1,
responsive: [
{
breakpoint: 992,
settings: {
arrows: true,
centerMode: true,
centerPadding: '0',
slidesToShow: 2
}
},
{
breakpoint: 768,
settings: {
arrows: true,
centerMode: true,
centerPadding: '0',
slidesToShow: 1
}
}
]
});

});
</script>
