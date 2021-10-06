$('a.mymenu-link').click(function(){
  $('.mymenu-link').not($(this)).parents('.mymenu').removeClass('currently-selected');
  $(this).parents('.mymenu').addClass('currently-selected');
});
