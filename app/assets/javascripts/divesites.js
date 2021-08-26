// sidebar
$('.select-area').click(function(){
  $(this).siblings('ul').slideToggle();
  $(this).siblings('i').toggleClass('before-click');
  $('.select-area').not($(this)).siblings('ul').slideUp();
  $('.select-area').not($(this)).siblings('i').addClass('before-click');
});

$('.zone').click(function(){
  var zoneLat = $(this).data('lat');
  var zoneLng = $(this).data('lng');
  console.log(zoneLat);

  setZone(zoneLat, zoneLng);
});
