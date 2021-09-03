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

  $("input[name='condition[divesite_id]']").val(`${dsId}`)
});

$('#js-copybtn').on('click', function(){
    // コピーする文章の取得
    let text = $('#js-copytext').text();
    // テキストエリアの作成
    let $textarea = $('<textarea></textarea>');
    // テキストエリアに文章を挿入
    $textarea.text(text);
    //　テキストエリアを挿入
    $(this).append($textarea);
    //　テキストエリアを選択
    $textarea.select();
    // コピー
    document.execCommand('copy');
    // テキストエリアの削除
    $textarea.remove();
    // アラート文の表示
    $('#js-copyalert').show().delay(2000).fadeOut(400);
  });
