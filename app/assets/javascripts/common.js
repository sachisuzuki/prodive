// 選択した画像でプレビューを表示する
$("#select_img").change(function(){
  var file = $(this).prop('files')[0];
  var imgSrc;
  if (file.type.match('image.*')) {
    imgSrc = '<img class="condition_img" id="img_prev" src="">';
  } else if (file.type.match('video.*')) {
    imgSrc = '<video class="condition_img" id="img_prev" src="">';
  }
  var reader = new FileReader();
  reader.onload = function() {
    $('.current-img').html(imgSrc);
    $('.current-img').children('#img_prev').attr('src', reader.result);

  }
  reader.readAsDataURL(file);
});

$("#select_avi").change(function(){
  const uploader = document.querySelector('#select_avi');
  if (uploader.files && uploader.files[0]) {
    const file = uploader.files[0];
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => {
      document.querySelector('#img_prev').setAttribute('src', reader.result);
    }
  }
});
