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
