// 選択した画像でプレビューを表示する
$("#select_img").change(function(){
  const uploader = document.querySelector('#select_img');
  if (uploader.files && uploader.files[0]) {
    const file = uploader.files[0];
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => {
      document.querySelector('#img_prev').setAttribute('src', reader.result);
    }
  }
});
