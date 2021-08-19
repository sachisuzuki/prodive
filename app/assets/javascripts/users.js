// 画像の変更
function readURL(input) {
  if (input.files && input.files[0]) {
    let reader = new FileReader();
    reader.onload = function (e) {
      $('#img_prev').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}
$("#select_img").change(function(){
  readURL(this);
});
