// 新規投稿のダイブサイト選択
// areaの選択結果でzoneの表示を変更
$('#parent').on('click', 'button', function() {
  var otherParents = $('#parent').children('button').not(this);

  otherParents.css('background-color', 'rgba(220,231,235,1)');
  otherParents.css('color', 'rgba(48,69,92,0.9)');

  $(this).css('background-color', 'rgb(58, 171, 210)');
  $(this).css('color', '#FCFAF2');

  var thisIdName = $(this).attr('id');

  var otherChildren = $('#children').children('div').not(`.${thisIdName}`);

  otherChildren.addClass('hidden');

  $('.note01').removeClass('hidden');

  $('.note02').addClass('hidden');

  $(`.${thisIdName}`).toggleClass('hidden');

  $('.grandchild').addClass('hidden');


});

// zoneの選択結果でダイブサイトの表示を変更
$('#children').on('click', 'button', function() {
  var otherParents = $('.child').children('button').not(this);

  otherParents.css('background-color', 'rgba(220,231,235,1)');
  otherParents.css('color', 'rgba(48,69,92,0.9)');

  $(this).css('background-color', 'rgb(58, 171, 210)');
  $(this).css('color', '#FCFAF2');

  var thisIdName = $(this).attr('id');

  var otherChildren = $('#grandchildren').children('div').not(`.${thisIdName}`);

  otherChildren.addClass('hidden');

  $('.note02').removeClass('hidden');

  $(`.${thisIdName}`).toggleClass('hidden');
});

// 選択されたdivesiteのidを送信
$('#grandchildren').on('click', 'button', function() {
  var otherParents = $('.grandchild').children('button').not(this);

  otherParents.css('background-color', 'rgba(220,231,235,1)');
  otherParents.css('color', 'rgba(48,69,92,0.9)');

  $(this).css('background-color', 'rgb(58, 171, 210)');
  $(this).css('color', '#FCFAF2');

  var dsId = $(this).attr('name')

  var dsName = $(this).text()

  $('.h3').text(`${dsName}`)

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
