document.addEventListener('turbo:load', function() {

const whiskeyForm = document.getElementById("new_whiskey") || document.getElementById("edit_whiskey");

if (!whiskeyForm) return;

const previewList = document.querySelector(".image-container #previews");
const fileField = document.querySelector('input[type="file"][name="whiskey[image]"]');

if (previewList && previewList.innerHTML.trim() !== "") {
  // 既に画像が表示されている場合の処理
  previewList.style.display = "block";
}

fileField.addEventListener("change", function(e) {
  const alreadyPreview = document.querySelector(".preview");
  if (alreadyPreview) {
    alreadyPreview.remove();
  }

  const file = e.target.files[0];
  const blob = window.URL.createObjectURL(file);

  const previewWrapper = document.createElement("div");
  previewWrapper.setAttribute("class", "preview");

  const previewImage = document.createElement("img");
  previewImage.setAttribute("class", "preview-image");
  previewImage.setAttribute("src", blob);

  previewWrapper.appendChild(previewImage);
  previewList.appendChild(previewWrapper);
  previewList.style.display = "block";
});
});

document.addEventListener('turbo:load', function() {
  const radioButtons = document.querySelectorAll('input[name="whiskey[remmaining_quantity_id]"]');
  const preview = document.getElementById('quantity-previews');

const selectedQuantityId = document.querySelector('input[name="whiskey[remmaining_quantity_id]"]:checked');
if (selectedQuantityId) {
  const initialQuantity = findQuantityById(selectedQuantityId.value);
  if (initialQuantity && initialQuantity.quantity_image) {
    const imagePath = '/assets/images/' + initialQuantity.quantity_image;
    preview.innerHTML = `<img src="${imagePath}" class="preview-image">`;
    preview.style.display = 'block';
  }
}
  radioButtons.forEach(radio => {
    radio.addEventListener('change', function () {
      const selectedQuantityId = this.value;
      const selectedQuantity = findQuantityById(selectedQuantityId);
      
      if (selectedQuantity && selectedQuantity.quantity_image) {
        const imagePath = '/assets/' + selectedQuantity.quantity_image;
        preview.innerHTML = `<img src="${imagePath}" class="preview-image" style="width: 450px; height: 450px; max-width: 50%;">`;
        preview.style.display = 'block';
      } else {
        preview.innerHTML = '';
        preview.style.display = 'none';
      }
    });
  });

  function findQuantityById(id) {
    const quantities = [
      { id: 1, quantity_image: '0ml-da07345a5d7d37d25a6708d59684c22ad8d8938fc5aef82425b912c087926ebc.jpg' },
      { id: 2, quantity_image: '100ml-fe2847030b618fbe139d25416ae57d3c989550fe9b9b4cf46988b3a4a8b583eb.jpg' },
      { id: 3, quantity_image: '200ml-bb43909277c1191baa9925d54966ade9be8fd56c25c566443df52f55c24e8acb.jpg' },
      { id: 4, quantity_image: '300ml-b60c9aed16ac0edc212288df9b65b9e8ef614d68e0bdc5095118e75a7718fad0.jpg' },
      { id: 5, quantity_image: '400ml-f21f5517accd4ff2435649c0fb76c06f4a7c2ffeb5e6e9e0b2581bf707091ef6.jpg' },
      { id: 6, quantity_image: '500ml-c4158a57be1065e2d52e7dfd7cd91ae0a9aef5bad5c4f153f1f62967a0c24f73.jpg' },
      { id: 7, quantity_image: '600ml-338e4ff4fde167b58a2d546d49af2810787931fb041497b4fbfcd90002ebbed6.jpg' },
      { id: 8, quantity_image: '700ml-b5f74551d4bc3c5626d88db365282a9cdd7bdd4b2d4ee2e994b09f4e30f9c113.jpg' }
    ];

    return quantities.find(quantity => quantity.id.toString() === id);
  }
});

