// マイページのメニュー選択
$('a.mymenu-link').click(function(){
  $('.mymenu-link').not($(this)).parents('.mymenu').removeClass('currently-selected');
  $(this).parents('.mymenu').addClass('currently-selected');
});


// マイページのサイドメニュースライド表示
$('a.sidemenu-btn').click(function() {
  $('.floating-board').addClass('active');
  $('.sidemenu-btn').addClass('after-click');
});

$('a.close-btn').click(function() {
  $('.floating-board').removeClass('active');
  $('.sidemenu-btn').removeClass('after-click');
});

$('a.mymenu-link').click(function() {
  $('.floating-board').removeClass('active');
  $('.sidemenu-btn').removeClass('after-click');
});
