const container = document.getElementById('container');

const toggle = () => {
    container.classList.toggle('sign-in');
    container.classList.toggle('sign-up');
    clearPhotoPreview();
};

setTimeout(() => {
    container.classList.add('sign-in');
}, 200);