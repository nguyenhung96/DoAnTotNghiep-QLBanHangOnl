var responsiveflag = false;
var loadIcon = "//cdn.shopify.com/s/files/1/0928/4804/t/2/assets/loading.gif?2264549637723899300";
$(document).ready(function() {

   responsiveResize();
   $(window).resize(responsiveResize);

   var owl = $('[data-owl="slide"]');
   owl.each(function(index, el) {
      var $item = $(this).data('item-slide');
      var $rtl = $(this).data('ow-rtl');
      var $loop = ($(this).data('loop') == true) ? true : false;
      var $dots = ($(this).data('dots') == true) ? true : false;
      var $nav = ($(this).data('nav') == false) ? false : true;
      var $navText = ($(this).data('nav-text') == false) ? ["prev","next"] : ["<i class='fa fa-chevron-left'></i>","<i class='fa fa-chevron-right'></i>"];
      var $margin = ($(this).data('margin')) ? $(this).data('margin') : 0;
      var $delay = ($(this).data('delay')) ? $(this).data('delay') : 1000;
      var $duration = ($(this).data('duration')) ? $(this).data('duration') : 450;
      var $autoplay = ($(this).data('autoplay')) ? $(this).data('autoplay') : false;
      var $desksmall_items = ($(this).data('desksmall')) ? $(this).data('desksmall') : (($item) ? $item : 4);
      var $tablet_items = ($(this).data('tablet')) ? $(this).data('tablet') : (($item) ? $item : 2);
      var $tabletsmall_items = ($(this).data('tabletsmall')) ? $(this).data('tabletsmall') : (($item) ? $item : 2);
      var $mobile_items = ($(this).data('mobile')) ? $(this).data('mobile') : (($item) ? $item : 1);
      var $tablet_margin = Math.floor($margin / 1.5);
      var $mobile_margin = Math.floor($margin / 3);
      var $default_items = ($item) ? $item : 5;
      $(this).owlCarousel({
         loop : $loop,
         nav : $nav,
         navText: $navText,
         dots: $dots,
         margin: $margin,
         rtl: $rtl,
         items : $default_items,
         autoplay: $autoplay,
         smartSpeed: $duration,
         responsive:{
            0:{
               items: $mobile_items, // In this configuration 1 is enabled from 0px up to 479px screen size
               margin: $mobile_margin
            },

            480:{
               items: $tabletsmall_items, // from 480 to 677 default 1
               margin: $tablet_margin
            },

            640:{
               items: $tablet_items, // from this breakpoint 678 to 959 default 2
               margin: $tablet_margin
            },

            991:{
               items: $desksmall_items, // from this breakpoint 960 to 1199 default 3
               margin: $margin

            },
            1199:{
               items: $default_items,
            }
         }
      });
   });

   if ($('.navbar-m').length > 0) {
      $('.navbar-mb').mmenu({
         "extensions":["pagedim-black","shadow-page","theme-dark"],
         "navbars":[{"position":"top","content":["prev","title","close"]}]
      });
   }

   $(".slt-link").change(function(){
      var chuoi = $(this).val();
      window.open(chuoi,'_blank');

   });

   $('.control-minus').click(function() {
      var quantity = $('input[name="quantity"]').val();
      if (quantity > 0) {
         $('input[name="quantity"]').val(quantity - 1);
         $('input[name="name"]').trigger("change");
      }
   });
   $('.control-add').click(function() {
      var quantity = $('input[name="quantity"]').val();
      var new_quant = parseInt(quantity) + 1;
      $('input[name="quantity"]').val(new_quant);
      $('input[name="name"]').trigger("change");
   });

   //addtocart index page
   $('body').on('click', '.btnMuaHang', function(event) {
      event.preventDefault();
      var idsp = $(this).attr('idsp');
      $.ajax({
         url: '/content/temp1/ajax_cart.php',
         type: 'POST',
         data: {'idsp': idsp},
      })
      .done(function() {
         window.location.href = "/xem-gio-hang";
      });
   });

   //addtocart
   $('.adtocart').on('click', function(event) {
      event.preventDefault();
      var idsp = $(this).attr('idtin');
      var sl = $('.slsp').val();
      $.ajax({
         url: '/content/temp1/ajax_cart.php',
         type: 'POST',
         data: {'idsp': idsp, 'qty': sl},
      })
      .done(function() {
         //window.location.href = "/xem-gio-hang";
         $('#hoadon').addClass('hjhj');
         $.ajax({
            url: '/content/temp1/ajax_order.php',
            type: 'POST',
            data: {'act': 'ggg'},
         }).done(function(rel){
            $('#hoadon .modal-body tbody tr').remove();
            $('#hoadon .modal-body tbody').append(rel);
            checkOrder();
         });
      });
   });
   $('.adtocart2').on('click', function(event) {
      event.preventDefault();
      var idsp = $(this).attr('idtin');
      var sl = $('.slsp').val();
      $.ajax({
         url: '/content/temp1/ajax_cart.php',
         type: 'POST',
         data: {'idsp': idsp, 'qty': sl},
      })
      .done(function() {
         window.location.href = "/dat-hang";
      });
   });

   $('.click_cart').on('click', function(event) {
      event.preventDefault();
      var idsp = $(this).attr('idtin');
      var sl = $(this).closest('tr').find('.slsp').val();
      $.ajax({
         url: '/content/temp1/ajax_cart.php',
         type: 'POST',
         data: {'idsp': idsp, 'qty': sl, 'update': 1},
      })
      .done(function() {
         window.location.href = "/xem-gio-hang";
      });
   });

   $('.deletet').on('click', function(event) {
      event.preventDefault();
      var idsp = $(this).closest('tr').find('.click_cart').attr('idtin');
      console.log(idsp);
      $.ajax({
         url: '/content/temp1/ajax_cart.php',
         type: 'POST',
         data: {'idsp': idsp, 'delete': 1},
      })
      .done(function(res) {
         window.location.href = "/xem-gio-hang";
      });
   });

   $(window).resize(function(){
      setTimeout(function(){
         $('body').sameHeightItems();
      },300);
   });

});
$(window).load(function(){
   $('body').sameHeightItems();
});

function productZoom(status) {
   if (status == 'enable') {
      $("#proimage").elevateZoom({

         zoomType: "inner",
         cursor: 'crosshair',

         gallery: 'thumbs_list',
         galleryActiveClass: 'active',
         imageCrossfade: true,
         scrollZoom: true,
         onImageSwapComplete: function() {
            $(".zoomWrapper div").hide()
         },
         loadingIcon: loadIcon
      });
      $("#proimage").bind("click", function(e) {
         var ez = $('#proimage').data('elevateZoom');
         $.fancybox(ez.getGalleryList());
         return false;
      });
   } else {
      $(document).on('click', '#thumblist .thumb_item a', function() {
         if ($(this).attr('href')) {
            var new_src = $(this).data('image');
            var new_title = $(this).attr('title');
            var new_href = $(this).attr('href');
            if ($('#proimage').attr('src') != new_src) {
               $('#proimage').attr({
                  'src': new_src,
                  'alt': new_title,
                  'title': new_title
               });
            }
         }
      });
   }
}

function productImage() {
   $('.thumblist').owlCarousel({
      items: 4,
      nav: true,
      dots: false,
      responsive: {
         0:{
            items: 4,
         },

         480:{
            items: 4,
         },
         640:{
            items: 4,
         },
         991:{
            items: 4,
         },

         1199:{
            items: 4,
         }
      }
   });
}

function scrollCompensate() {
   var inner = document.createElement('p');
   inner.style.width = "100%";
   inner.style.height = "200px";

   var outer = document.createElement('div');
   outer.style.position = "absolute";
   outer.style.top = "0px";
   outer.style.left = "0px";
   outer.style.visibility = "hidden";
   outer.style.width = "200px";
   outer.style.height = "150px";
   outer.style.overflow = "hidden";
   outer.appendChild(inner);

   document.body.appendChild(outer);
   var w1 = inner.offsetWidth;
   outer.style.overflow = 'scroll';
   var w2 = inner.offsetWidth;
   if (w1 == w2) w2 = outer.clientWidth;

   document.body.removeChild(outer);

   return (w1 - w2);
}

function responsiveResize() {
   compensante = scrollCompensate();
   if (($(window).width() + scrollCompensate()) <= 767 && responsiveflag == false) {
      accordion('enable');
      accordionFooter('enable');
      responsiveflag = true;
   } else if (($(window).width() + scrollCompensate()) >= 768) {
      accordion('disable');
      accordionFooter('disable');
      responsiveflag = false;
   }
}

function responsiveProductZoom() {
   if (($(window).width()) >= 992) {
      productZoom('enable');
   } else if (($(window).width()) <= 991) {
      productZoom('disable');
   }
}

function accordion(status) {
   leftColumnBlocks = $('#left-sidebar');
   if (status == 'enable') {
      if (!$('#left-sidebar').hasClass('accordion')) {
         $('#left-sidebar .section-title').on('click', function() {
            $(this).toggleClass('active').parent().find('.content-widget').stop().slideToggle('medium');
         });
      }
      if (!$('#right-sidebar').hasClass('accordion')) {
         $('#right-sidebar .section-title').on('click', function() {
            $(this).toggleClass('active').parent().find('.content-widget').stop().slideToggle('medium');
         });
      }
      $('#left-sidebar').addClass('accordion').find('.content-widget').slideUp('fast');
      $('#right-sidebar').addClass('accordion').find('.content-widget').slideUp('fast');
   } else {
      $('#right-sidebar .section-title, #left-sidebar .section-title').removeClass('active').off().parent().find('.content-widget').removeAttr('style').slideDown('fast');
      $('#left-sidebar, #right-sidebar').removeClass('accordion');
   }
}

function accordionFooter(status) {
   if (status == 'enable') {
      if (!$('#footercenter').hasClass('accordion')) {
         $('#footercenter .footer-block h4').on('click', function() {
            $(this).toggleClass('active').parent().find('.content-widget').stop().slideToggle('medium');
         })
      }
      $('#footercenter').addClass('accordion').find('.content-widget').slideUp('fast');
   } else {
      $('.footer-block h4').removeClass('active').off().parent().find('.content-widget').removeAttr('style').slideDown('fast');
      $('#footercenter').removeClass('accordion');
   }
}

$.fn.sameHeightItems = function(options){
   var defaultConfig = {
      parent: '.same-height',
      sItem: '.product-item',
   };
   var conf = $.extend(defaultConfig, options || {});
   var parent = conf.parent;
   var sItem = conf.sItem;
   $(this).each(function() {
      var processing;
      var $wrap = $(this);
      if ($wrap.find(parent).length > 0) {
         $wrap.find(parent).each(function() {
            var $ul = $(this);
            var setMaxHeight = function() {
               var maxHeight = 0;
               $ul.find(sItem).css('height', '');
               $ul.find(sItem).each(function() {
                  if ($(this).height() >= maxHeight) {
                     maxHeight = $(this).height();
                  }
               });
               $ul.find(sItem).height(maxHeight);
            };
            //setMaxHeight();

            if ($ul.find('.product-image').length > 0) {
               $ul.find('.product-image').last().find('img').first().each(function() {
                  if (this.complete) {
                     setMaxHeight();
                  } else {
                     $(this).on('load.setMaxHeight', function() {
                        setMaxHeight();
                        $(this).off('load.setMaxHeight');
                     });
                  }
               });
            } else {
               setMaxHeight();
            }
         });
      }
   });
};


// Footer ad
function HienChuyenDe() {
   var tenchuyende = document.getElementById('divchuyende');
   var NutHien = document.getElementById('divNutHien');
   var nut = document.getElementById('divNut');
   var divHinh = document.getElementById('divHinh');

   if (tenchuyende != null) {
      tenchuyende.style.display = 'none';
      tenchuyende.style.border = '0px solid #aaa';
   }

   if (NutHien != null) {
      NutHien.style.display = 'none';
   }

   if (nut != null) {
      nut.style.display = 'block';
   }

   if (divHinh != null) {
      divHinh.style.display = 'block';
   }
}

function AnChuyenDe() {
   var tenchuyende = document.getElementById('divchuyende');
   var NutHien = document.getElementById('divNutHien');
   var nut = document.getElementById('divNut');
   var divHinh = document.getElementById('divHinh');

   if (tenchuyende != null) {
      tenchuyende.style.display = 'block';
      tenchuyende.style.border = '1px solid #aaa';
   }

   if (NutHien != null) {
      NutHien.style.display = 'block';
   }

   if (nut != null) {
      nut.style.display = 'none';
   }

   if (divHinh != null) {
      divHinh.style.display = 'none';
   }
}


// Slide banner
var slideTime = 500;
var floatAtBottom = false;

function pepsi_floating_init() {
   xMoveTo('floating_banner_right', 887 - (1024 - screen.width), 0);

   winOnResize(); // set initial position
   xAddEventListener(window, 'resize', winOnResize, false);
   xAddEventListener(window, 'scroll', winOnScroll, false);
}

function winOnResize() {
   checkScreenWidth();
   winOnScroll(); // initial slide
}
function checkOrder(){
   $.ajax({
      url: '/content/temp1/ajax_order.php',
      type: 'POST',
      data: {'act': 'fff'},
   }).done(function(rel){
      $('.t-giohang a div span:last-child').remove();
      $('.t-giohang a div').append('<span>'+rel+'</span>');
   });
}
function winOnScroll() {
   var y = xScrollTop();
   if (floatAtBottom) {
      y += xClientHeight() - xHeight('floating_banner_left');
   }

   xSlideTo('floating_banner_left', (screen.width - (1100 - 735) - 770) / 2 - 115, y, slideTime); // Chỉnh khoảng cách bên trái
   xSlideTo('floating_banner_right', (screen.width - (570 - 880) + 770) / 2, y, slideTime); // // Chỉnh khoảng cách bên Phải
}

function checkScreenWidth() {
   if (document.body.clientWidth < 926) {
      document.getElementById('floating_banner_left').style.display = 'none';
      document.getElementById('floating_banner_right').style.display = 'none';
   } else {
      document.getElementById('floating_banner_left').style.display = '';
      document.getElementById('floating_banner_right').style.display = '';
   }
}
