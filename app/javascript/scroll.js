 // スクロールしたらメッセージを非表示にする
 window.addEventListener('scroll', function() {
  const indicator = document.querySelector('.slide-indicator');
  if (window.scrollY > 100) { // 100px以上スクロールしたら非表示
    indicator.style.display = 'none';
  }
});
