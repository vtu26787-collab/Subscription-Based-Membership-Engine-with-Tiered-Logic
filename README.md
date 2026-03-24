# Subscription-Based Membership Engine

A complete SaaS web application for subscription-based content streaming with tiered access control.

## Features

- User registration and authentication (JWT + bcrypt)
- Tiered subscription plans (Free, Basic, Premium, Enterprise)
- Content library with access control based on subscription
- Video and audio players
- Admin panel for content management and analytics
- Responsive UI with modern design

## Tech Stack

- **Frontend:** HTML5, CSS3, Vanilla JavaScript
- **Backend:** Node.js, Express.js
- **Database:** MySQL
- **Authentication:** JWT, bcrypt
- **Charts:** Chart.js

## Setup Instructions

### Prerequisites

- Node.js (v14 or higher)
- MySQL Server
- Git

### 1. Clone the Repository

```bash
git clone <repository-url>
cd subscription-engine
```

### 2. Database Setup

1. Install MySQL and create a database.
2. Run the schema script:

```bash
mysql -u root -p < database/schema.sql
```

This will create the database `subscription_engine` and insert sample data.

### 3. Backend Setup

1. Navigate to the backend directory:

```bash
cd backend
```

2. Install dependencies:

```bash
npm install
```

3. Configure environment variables in `.env` (already set with defaults).

4. Start the server:

```bash
npm start
```

The backend will run on `http://localhost:5000`.

### 4. Frontend Setup

The frontend is static HTML/CSS/JS, so no build is required. Serve it using a static server or open `frontend/index.html` in a browser.

For development, you can use a simple HTTP server:

```bash
cd frontend
npx http-server
```

### Quick Start (One Command)

To run the entire project with one command (assumes MySQL is running):

1. Install dependencies and start everything:

```bash
npm install
npm start
```

This will:
- Install backend dependencies
- Set up the database (run schema.sql)
- Start the backend server on port 5000
- Start the frontend server on port 3000

Note: If the database already exists, the setup-db step may show errors but will continue.

### 5. Access the Application

- **Landing Page:** `http://localhost:3000` (or wherever you serve frontend)
- **Backend API:** `http://localhost:5000/api`

## Admin Credentials

- **Email:** admin@admin.com
- **Password:** password

## Test Users

- **Email:** user@test.com
- **Password:** password

## API Endpoints

### Auth
- `POST /api/register` - Register user
- `POST /api/login` - User login
- `POST /api/admin/login` - Admin login

### Plans
- `GET /api/plans` - Get all plans
- `POST /api/subscribe` - Subscribe to plan
- `GET /api/user/subscription` - Get user subscription
- `PUT /api/change-plan` - Change plan

### Content
- `GET /api/content` - Get accessible content
- `GET /api/content/:id` - Get content by ID
- `POST /api/admin/add-content` - Add content (admin)
- `DELETE /api/admin/content/:id` - Delete content (admin)

### Admin
- `GET /api/admin/users` - Get all users
- `GET /api/admin/subscriptions` - Get all subscriptions
- `GET /api/admin/revenue` - Get total revenue

## Project Structure

```
subscription-engine/
├── backend/
│   ├── config/
│   ├── controllers/
│   ├── middleware/
│   ├── models/
│   ├── routes/
│   ├── server.js
│   ├── package.json
│   └── .env
├── frontend/
│   ├── css/
│   ├── js/
│   ├── pages/
│   └── index.html
├── database/
│   └── schema.sql
└── README.md
```

## Running Tests

No automated tests are included, but you can manually test the features by registering users, subscribing to plans, and accessing content.

## License

This project is for educational purposes.