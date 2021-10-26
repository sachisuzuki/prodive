// 選択した画像でプレビューを表示する(image)
$("#select_img").change(function(){
  var file = $(this).prop('files')[0];
  var imgSrc;
  if (file.type.match('image.*')) {
    imgSrc = '<img class="condition_img" id="img_prev" src="">';
  } else if (file.type.match('video.*')) {
    imgSrc = '<video class="condition_img" id="img_prev" src="">';
  }
  var reader = new FileReader();
  reader.onload = function() {
    $('.current-img').html(imgSrc);
    $('.current-img').children('#img_prev').attr('src', reader.result);

  }
  reader.readAsDataURL(file);
});

// 選択した画像でプレビューを表示する(avatar)
$("#select_avi").change(function(){
  const uploader = document.querySelector('#select_avi');
  if (uploader.files && uploader.files[0]) {
    const file = uploader.files[0];
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => {
      document.querySelector('#img_prev').setAttribute('src', reader.result);
    }
  }
});

// ハンバーガーメニュー
$('.nav-toggle').click(function () {
  $('.nav-toggle, nav.header-menu').toggleClass('active');
  $('html').toggleClass('no-scroll');
});

// scroll時のヘッダー
// scroll時のダイバー
$(function(){
  var pos = 100;

  $(window).on('load scroll', function(){
    if ($(this).scrollTop() > pos ){
      //下にスクロールしたとき
      $('header').addClass('after-scroll');
      $('.diver').addClass('scroll-down').removeClass('scroll-up');

    }else{
      //上にスクロールしたとき
      $('header').removeClass('after-scroll');
      $('.diver').removeClass('scroll-down').addClass('scroll-up');
    }
    pos = $(this).scrollTop();
    if (pos < 100) {
      $('header').removeClass('after-scroll');
      $('.diver').removeClass('scroll-down').removeClass('scroll-up');
    }

  });
});

$(function () {
  // animation呼び出し
  if ($('.translucent-box.left').length) {
      scrollAnimation();
  }

  // animation関数
  function scrollAnimation() {
      $(window).on('scroll', function(){
          $(".translucent-box").each(function () {
              let position = $(this).offset().top,
                  scroll = $(window).scrollTop(),
                  windowHeight = $(window).height();

              if (scroll > position - windowHeight + 200) {
                  $(this).addClass('scroll-down').removeClass('scroll-up');
              } else {
                $(this).removeClass('scroll-down').addClass('scroll-up');
              }
          });
      });
  }
  $(window).trigger('scroll');
});
