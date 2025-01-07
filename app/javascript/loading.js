$(document).on('turbo:load', function() {
  const loading = document.querySelector('.loader-wrap');
  
    loading.classList.add('loaded');
});

$(document).on('turbo:submit-end', function() {
  const loading = document.querySelector('.loader-wrap');
  loading.classList.add('loaded');  // ローディング終了
});

