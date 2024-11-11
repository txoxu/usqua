document.addEventListener('turbo:load', function() {
  const radioImage = document.getElementById('vbtn-radio1');
  const radioQuantity = document.getElementById('vbtn-radio2');

  const formImage = document.getElementById('form-image');
  const formQuantity = document.getElementById('form-quantity');
  const formImagePreviews = document.getElementById('previews-form');
  const formQuantityPreviews = document.getElementById('quantity-previews-form');

  if (radioImage.checked) {
    formImage.style.display = 'block';
    formImagePreviews.style.display = 'block';
    formQuantity.style.display = 'none';
    formQuantityPreviews.style.display = 'none';
  }

  radioImage.addEventListener('change', function() {
    if (radioImage.checked) {
      formImage.style.display = 'block';
    formImagePreviews.style.display = 'block';
    formQuantity.style.display = 'none';
    formQuantityPreviews.style.display = 'none';
    }
  });

  radioQuantity.addEventListener('change', function() {
    if (radioQuantity.checked) {
      formImage.style.display = 'none';
    formImagePreviews.style.display = 'none';
    formQuantity.style.display = 'block';
    formQuantityPreviews.style.display = 'block';
    }
  });
});
