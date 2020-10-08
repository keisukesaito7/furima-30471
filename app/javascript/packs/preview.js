if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function() {
    const ImagePreview = document.getElementById('image-preview');
    const ItemImage = document.getElementById('item-image');
  
    ItemImage.addEventListener('change', (e) => {
      // 既に画像があれば、divごと削除
      const existImage = document.getElementById('insert-field');
      if (existImage) {
        existImage.remove();
      }
      
      // 画像のURLを取得
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      
      // 画像を入れる要素を生成 (img, div)
      const insertField = document.createElement('div');
      const blobImage = document.createElement('img');

      // img, divに属性付与（同じ高さになるように）
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('style', 'height: 100%');
      insertField.setAttribute('id', 'insert-field');
      insertField.setAttribute('style', 'height: 200px;');
  
      // 既存のdivに格納
      insertField.appendChild(blobImage);
      ImagePreview.appendChild(insertField);
    });
  });
}
