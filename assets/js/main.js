
$('.slick-banner').slick({
  arrows: false,
  dots: true
});


$('.multiple-items').slick({
  infinite: true,
  slidesToShow: 4,
  slidesToScroll: 2,
  dots: true,

  responsive: [
    {
      breakpoint: 500,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,

      }
    },

    {
      breakpoint: 900,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2,

      }
    },

    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3,

      }
    }
  ]
});


// counter

// var a = 0;
// $(window).scroll(function () {

//   var oTop = $('#counter').offset().top - window.innerHeight;
//   if (a == 0 && $(window).scrollTop() > oTop) {
//     $('.counter-value').each(function () {
//       var $this = $(this),
//         countTo = $this.attr('data-count');
//       $({
//         countNum: $this.text()
//       }).animate({
//         countNum: countTo
//       },

//         {

//           duration: 2000,
//           easing: 'swing',
//           step: function () {
//             $this.text(Math.floor(this.countNum));
//           },
//           complete: function () {
//             $this.text(this.countNum);
//             //alert('finished');
//           }

//         });
//     });
//     a = 1;
//   }

// });