const toggle = document.querySelector('.mobile-menu-toggle');
const nav = document.querySelector('nav ul');

toggle.addEventListener('click', () => {
    nav.classList.toggle('active');
});
