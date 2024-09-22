let blogs = [];
let subjects = [];
let lessons = [];

let itemsPerPage = 4;
let currentItems = blogs;
let activeContainer = 'blog-list';
let activePagination = 'blog-pagination';

function paginate(items, containerId, paginationId) {
    const container = document.getElementById(containerId);
    const pagination = document.getElementById(paginationId);
    let currentPage = 1;

    function renderPage(page) {
        container.innerHTML = "";
        const start = (page - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        const pageItems = items.slice(start, end);

        pageItems.forEach(item => {
            const card = document.createElement('div');
            card.className = 'card';
            card.innerHTML = `
                <img src="${item.image}" alt="${item.title}">
                <h3>${item.title}</h3>
                <p>${item.description}</p>
            `;
            container.appendChild(card);
        });

        renderPagination(page);
    }

    function renderPagination(page) {
        pagination.innerHTML = "";
        const totalPages = Math.ceil(items.length / itemsPerPage);

        for (let i = 1; i <= totalPages; i++) {
            const span = document.createElement('span');
            span.textContent = i;
            span.className = i === page ? 'active' : '';
            span.onclick = () => renderPage(i);
            pagination.appendChild(span);
        }
    }

    renderPage(currentPage);
}

function showContent(type) {
    if (type === 'blog') {
        currentItems = blogs;
        activeContainer = 'blog-list';
        activePagination = 'blog-pagination';
    } else if (type === 'subject') {
        currentItems = subjects;
        activeContainer = 'subject-list';
        activePagination = 'subject-pagination';
    } else if (type === 'lesson') {
        currentItems = lessons;
        activeContainer = 'lesson-list';
        activePagination = 'lesson-pagination';
    }

    document.getElementById('blog-content').style.display = type === 'blog' ? 'block' : 'none';
    document.getElementById('subject-content').style.display = type === 'subject' ? 'block' : 'none';
    document.getElementById('lesson-content').style.display = type === 'lesson' ? 'block' : 'none';

    paginate(currentItems, activeContainer, activePagination);
}

function searchItems() {
    const query = document.getElementById('search-input').value.toLowerCase();
    const filteredItems = currentItems.filter(item => item.title.toLowerCase().includes(query));
    paginate(filteredItems, activeContainer, activePagination);
}

// Initialize with blogs
paginate(blogs, "blog-list", "blog-pagination");
paginate(subjects, "subject-list", "subject-pagination");

