// General app functions
const API_BASE = 'http://localhost:5000/api';

// Initialize Theme on load
document.addEventListener('DOMContentLoaded', () => {
    // Inject Floating Chat Widget
    if (!document.querySelector('.saas-chat-widget')) {
        const chat = document.createElement('div');
        chat.className = 'saas-chat-widget';
        chat.innerHTML = `
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="black" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"/>
            </svg>
        `;
        chat.onclick = () => showAlert('NexaFlow AI Assistant is coming soon!');
        document.body.appendChild(chat);
    }
});

function getToken() {
    return localStorage.getItem('token');
}

function getUser() {
    return JSON.parse(localStorage.getItem('user'));
}

function logout() {
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    // More robust redirect to root index
    const isInsidePages = window.location.pathname.includes('/pages/');
    window.location.href = isInsidePages ? '../index.html' : 'index.html';
}

function checkAuth() {
    if (!getToken()) {
        const isInsidePages = window.location.pathname.includes('/pages/');
        window.location.href = isInsidePages ? 'login.html' : 'pages/login.html';
    }
}

function checkAdmin() {
    const user = getUser();
    if (!user || user.role !== 'admin') {
        alert('Admin access required');
        const isInsidePages = window.location.pathname.includes('/pages/');
        window.location.href = isInsidePages ? 'login.html' : 'pages/login.html';
    }
}

// Utility to show alerts
function showAlert(message, type = 'info') {
    alert(message); // Simple alert, can be enhanced with toast
}