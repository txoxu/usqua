// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"


document.getElementById('image_input').addEventListener('change', function (e) {
  // 1枚だけ表示する
  var file = e.target.files[0];

  // ファイルのブラウザ上でのURLを取得する
  var blobUrl = window.URL.createObjectURL(file);

  // img要素に表示
  var img = document.getElementById('image_preview');
  img.src = blobUrl;
});
