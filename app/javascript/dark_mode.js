document.addEventListener('turbo:load', function() {
  const btn = document.querySelector('#btn');

  // ページが読み込まれた時にローカルストレージから状態を読み込む
  if (localStorage.getItem('theme') === 'dark') {
    document.body.classList.add('dark-theme');
    btn.textContent = 'ライトモード';
  } else {
    document.body.classList.remove('dark-theme');
    btn.textContent = 'ダークモード';
  }

  btn.addEventListener('click', () => {
    document.body.classList.toggle('dark-theme');

    // ダークモードの状態をローカルストレージに保存
    if (document.body.classList.contains('dark-theme')) {
      localStorage.setItem('theme', 'dark');
      btn.textContent = 'ライトモード';
    } else {
      localStorage.setItem('theme', 'light');
      btn.textContent = 'ダークモード';
    }
  });
});
