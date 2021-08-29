// 選択した画像でプレビューを表示する
function readURL(input) {
  if (input.files && input.files[0]) {
    let reader = new FileReader();
    reader.onload = function (e) {
      replaceImgVodeo(e.target.result, $('#img_prev'));
      $('#img_prev').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}
$("#select_img").change(function(){
  readURL(this);
});

// 選択したのがファイルに合わせて、プレビューのhtmlタグを置き換える（img ⇄ video）
function replaceImgVodeo(url, target) {
  var tag_class = target.attr("class");
  var tag_class_plus = 'class="'+tag_class+'"';
  var tag_id = target.attr("id");
  var tag_id_plus = 'id="'+tag_id+'"';

  if (url.match(/video/)) {
    target.replaceWith('<video '+tag_id_plus+'  '+tag_class_plus+'>'+'</video>');
  } else {
    target.replaceWith('<img '+tag_id_plus+'  '+tag_class_plus+'>'+'</img>');
  }
}
