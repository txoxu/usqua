 // ページ全体を初回ページ読み込み時にイベントを発生させる
 document.addEventListener('turbo:load', function() {

  //idがselectの要素を取り出し定数selectへ代入、selecterも同様
  const select = document.getElementById('select');
  const selecter = document.getElementById('selecter');

  //selectがクリックされたときにイベントを発生
  select.addEventListener('click', function(event) {
    event.preventDefault(); // デフォルトのリンク動作を無効化

    // 非同期リクエストを送信
    fetch('/select.json')
      .then(response => response.json()) // JSON形式でレスポンスを解析
      .then(data => {
        // 取得したデータを表示
        selecter.innerHTML = data + "で一杯！";
      })
      .catch(error => {
        console.error("Error:", error);
      });
  });
});
