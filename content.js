// Content functions - Modern SaaS UI
document.addEventListener('DOMContentLoaded', () => {
    checkAuth();
    loadContent();
});

async function loadContent() {
    try {
        const res = await fetch(`${API_BASE}/content`, {
            headers: { 'Authorization': `Bearer ${getToken()}` }
        });
        const allContent = await res.json();
        
        const rowsContainer = document.getElementById('contentContainer');
        if (!rowsContainer) {
            console.error('contentContainer not found');
            return;
        }
        rowsContainer.innerHTML = '';

        allContent.forEach(item => {
            renderSaasCard(item);
        });

    } catch (err) {
        console.error(err);
        showAlert('Failed to load researcher repository', 'error');
    }
}

function renderSaasCard(item) {
    const rowsContainer = document.getElementById('contentContainer');
    
    const cardHtml = `
        <div class="saas-card fade-in" onclick="playContent(${item.id})">
            <span class="saas-card-tag">${item.required_plan}</span>
            <div style="font-size: 0.8rem; color: var(--saas-text-dim); margin-bottom: 8px;">REF: HUB-${item.id}</div>
            <h3>${item.title}</h3>
            <p>${item.description || 'Access the full manuscript and data analysis in our premium repository. This document includes deep-dive methodology and conclusion sections.'}</p>
            <div style="margin-top: 20px; display: flex; align-items: center; justify-content: space-between;">
                <span style="font-size: 0.8rem; color: var(--saas-text-dim);">${item.type.toUpperCase()}</span>
                <span style="color: var(--saas-accent); font-weight: 600; font-size: 0.9rem;">View Paper →</span>
            </div>
        </div>
    `;
    rowsContainer.innerHTML += cardHtml;
}

function playContent(id) {
    window.location.href = `player.html?id=${id}`;
}