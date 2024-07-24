document.addEventListener('DOMContentLoaded', function () {
  const cartLink = document.getElementById('cart-link');
  const cartContainer = document.getElementById('cartContainer');
  const cartClose = document.getElementById('cartClose');

  cartLink.addEventListener('click', () => {
    cartContainer.classList.toggle('visible'); // Toggle cart visibility
  });

  cartClose.addEventListener('click', () => {
    cartContainer.classList.remove('visible');
     // Close the cart
  });
});