// 新規投稿のダイブサイト選択
// areaの選択結果でzoneの表示を変更
$('#parent').on('click', 'button', function() {
  var otherParents = $('#parent').children('button').not(this);

  otherParents.css('color', 'black');

  $(this).css('color', 'blue');

  var thisIdName = $(this).attr('id');

  var otherChildren = $('#children').children('div').not(`.${thisIdName}`);

  otherChildren.addClass('hidden');

  $(`.${thisIdName}`).toggleClass('hidden');

  $('.grandchild').addClass('hidden');


});

// zoneの選択結果でダイブサイトの表示を変更
$('#children').on('click', 'button', function() {
  var otherParents = $('.child').children('button').not(this);

  otherParents.css('color', 'black');

  $(this).css('color', 'blue');

  var thisIdName = $(this).attr('id');

  var otherChildren = $('#grandchildren').children('div').not(`.${thisIdName}`);

  otherChildren.addClass('hidden');

  $(`.${thisIdName}`).toggleClass('hidden');
});

// 選択されたdivesiteのidを送信
$('#grandchildren').on('click', 'button', function() {
  var otherParents = $('.grandchild').children('button').not(this);

  otherParents.css('color', 'black');

  $(this).css('color', 'blue');

  var dsId = $(this).attr('name')

  var dsName = $(this).text()

  $('.h4').text(`${dsName}`)

  $("input[name='condition[divesite_id]']").val(`${dsId}`)
});
