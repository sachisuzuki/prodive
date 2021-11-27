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

  $('.response').text('_ _ _ _').css('background-color', 'rgba(220,231,235,1)').css('color', 'rgba(48,69,92,0.9)');

  $("input[name='condition[divesite]']").val('');screenTop

  $("input[name='condition[divesite]']").prop('disabled', false);

  $("input[name='condition[divesite_id]']").val('');

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

  var dsId = $(this).attr('name');

  var dsName = $(this).text();

  $('.response').text(`${dsName}`).css('color', '#FCFAF2').css('background-color', 'rgba(48,69,92,0.9)');

  $("input[name='condition[divesite]']").val(`${dsName}`);

  $("input[name='condition[divesite]']").prop('disabled', true);

  $("input[name='condition[divesite_id]']").val(`${dsId}`);
});

// 投稿コメント部分をコピー
$('#js-copybtn').on('click', function(){
    let text = $('#js-copytext').text();
    let $textarea = $('<textarea></textarea>');
    $textarea.text(text);
    $(this).append($textarea);
    $textarea.select();
    document.execCommand('copy');
    $textarea.remove();
    $('#js-copyalert').show().delay(2000).fadeOut(400);
  });

// 投稿一覧の see more の動き
  $('.accordion-header').click(function(){
      if ( $(this).next().is( ":hidden" ) ) {
        let notThisI =　$('.accordion-header').not($(this))
        $('.accordion-inner').slideUp('selected');
        notThisI.children('i').addClass('before-click');
        $(this).children('i').toggleClass('before-click');
        $(this).next().slideDown('selected');

      } else {
        $(this).next().slideUp('selected');
        $(this).children('i').addClass('before-click');
      };
  });
