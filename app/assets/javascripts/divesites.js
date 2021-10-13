// sidebar
$('.select-area').click(function(){
  $(this).siblings('ul').slideToggle();
  $(this).siblings('i').toggleClass('before-click');
  $('.select-area').not($(this)).siblings('ul').slideUp();
  $('.select-area').not($(this)).siblings('i').addClass('before-click');
});

$('.zone').click(function(){
  let zoneLat = $(this).data('lat');
  let zoneLng = $(this).data('lng');
  setZone(zoneLat, zoneLng);

  $('.zone').not(this).parent('li').css('background-color', 'white');
  $('.zone').not(this).css('color', 'rgba(48,69,92,0.9)');
  $(this).parent('li').css('background-color', 'rgba(48,69,92,0.9)');
  $(this).css('color', '#FCFAF2');

  $('.map-contents').removeClass('hidden');
});

// 海況MAPのサイドメニュースライド表示
$('a.select-menu-btn').click(function() {
  $('.floating-board').addClass('active');
  $('.select-menu-btn').addClass('after-click');
});

$('a.close-btn').click(function() {
  $('.floating-board').removeClass('active');
  $('.select-menu-btn').removeClass('after-click');
});

$('a.zone').click(function() {
  $('.floating-board').removeClass('active');
  $('.select-menu-btn').removeClass('after-click');
});
