# Buhoor

Buhoor is an Arabic poetry app with a Flutter client and a Node.js backend.

The app provides poem and poet browsing, filtering, and search over a curated Arabic poetry dataset.

## Project Structure

- `app/`: Flutter mobile application
- `backend/`: Express API server (PostgreSQL for poetry data, MongoDB for auth data)

## Current Status

- Core poetry browsing and search features are implemented.
- Authentication is not fully implemented in the app flow for the moment.

## Features

### Flutter App (`app/`)

- Arabic-first UI (locale set to Arabic)
- Light/Dark theme.
- Home screen with:
	- Random poem
	- Random poet
	- Quick navigation to poets, eras, meters, and genres
- Poetry browsing:
	- Filter poems by poet, era, genre, meter
	- Pagination support
- Poets browsing:
	- List view with pagination
	- Poet details and related poems
- Search:
	- Unified keyword search across poems and poets

### Backend API (`backend/`)

- REST API built with Express
- PostgreSQL queries for poems/poets/search endpoints
- Auth endpoints using MongoDB + JWT (available, but not integrated into active Flutter flow)

## Tech Stack

### App

- Flutter
- GetX (state management/routing)
- Dio (HTTP client)
- json_serializable / json_annotation

### Backend

- Node.js + Express
- PostgreSQL (`pg`)
- MongoDB (`mongoose`)
- JWT (`jsonwebtoken`)
- bcrypt
- dotenv

## Prerequisites

### For Flutter App

- Flutter SDK installed and configured
- Android Studio/Xcode/emulator or physical device

### For Backend

- Node.js (LTS recommended)
- PostgreSQL database with required poetry schema/data
- MongoDB instance

## Backend Setup

From the repository root:

```bash
cd backend
npm install
```

Create a `.env` file in `backend/` with:

```env
PORT=3000
DB_USER=your_pg_user
DB_HOST=your_pg_host
DB_NAME=your_pg_database
DB_PASSWORD=your_pg_password
DB_PORT=5432
MONGO_URI=your_mongodb_connection_string
JWT_KEY=your_jwt_secret
```

Run backend:

```bash
npm run dev
# or
npm start
```

## Flutter App Setup

From the repository root:

```bash
cd app
flutter pub get
flutter run
```

### API Base URL

The app currently reads API base URL from:

- `app/lib/core/constants.dart` → `MyConstants.baseUrl`

Update this constant if you want to target local backend (for example `http://localhost:3000`).

## API Overview

Base URL: `http://<host>:<port>`

### Poems

- `GET /poems`
	- Query params: `id`, `era`, `poet`, `genre`, `meter`, `page`
	- `id` returns a single poem
	- without `id`, returns paginated results (`pageSize = 20`)

### Poets

- `GET /poets`
	- Query params: `id`, `page`
	- `id` returns one poet
	- without `id`, returns 20 poets per page

### Search

- `GET /search?q=<keyword>`
	- Returns mixed results with `type` (`poems` or `poets`)

### Auth (Backend-available, app flow not active yet)

- `POST /auth/register`
- `POST /auth/login`
- `GET /auth/profile` (Bearer token required)

## Notes

- `backend/api.http` includes example requests for manual endpoint testing.
- Some examples in `backend/api.http` use port `8000`; adjust them to match your `PORT` value (default in this README is `3000`).
- The backend code currently opens both PostgreSQL and MongoDB connections because poetry and auth data are split by responsibility.

## License

MIT (see `LICENSE.md`).
