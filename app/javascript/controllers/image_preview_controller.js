import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "preview", "quantityInput", "quantityPreview"];

  connect() {
    if (this.hasInputTarget) {
      this.inputTarget.addEventListener('change', this.previewImage.bind(this));
    }

    if (this.hasQuantityInputTarget) {
      this.quantityInputTarget.addEventListener('change', this.updateQuantityImagePreview.bind(this));
    }
  }

  previewImage(event) {
    const file = event.target.files[0];
    if (!file) return;

    // Remove existing preview if any
    this.previewTarget.innerHTML = '';

    // Create URL for the selected file
    const blob = window.URL.createObjectURL(file);

    // Create an img element and set its src to the blob URL
    const img = document.createElement('img');
    img.setAttribute('src', blob);
    img.setAttribute('class', 'preview-image');

    // Append the img element to the preview target
    this.previewTarget.appendChild(img);
  }

  updateQuantityImagePreview(event) {
    const selectedQuantityId = event.target.value;

    if (!selectedQuantityId) {
      this.quantityPreviewTarget.innerHTML = '';
      return;
    }

    fetch(`/remmaining_quantities/${selectedQuantityId}/image_path`)
      .then(response => response.json())
      .then(data => {
        this.quantityPreviewTarget.innerHTML = '';

        if (data.image_path) {
          const img = document.createElement('img');
          img.setAttribute('src', data.image_path);
          img.setAttribute('class', 'preview-image');
          this.quantityPreviewTarget.appendChild(img);
        }
      });
  }
}
