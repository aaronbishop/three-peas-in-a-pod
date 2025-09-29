# Three Peas in a Pod

An enterprise-grade family cookbook application built with **Rails 8 (API-first)** and **React (Vite + Tailwind + TypeScript)** on **PostgreSQL**, following best practices in **DDD, TDD/BDD, CI/CD, and Agile delivery**.

---

## Overview

**Three Peas in a Pod** is a full-stack recipe and cooking application designed with enterprise development methodology. It demonstrates:

- **Domain-Driven Design (DDD)** – clearly modeled entities like `User`, `Recipe`, `Ingredient`, `Comment`, `Favorite`.
- **Test-Driven Development (TDD/BDD)** – comprehensive unit, integration, and feature coverage.
- **Security & Compliance** – role-based access control, data sanitization, 2FA support, rate limiting.
- **Scalable Architecture** – Rails 8 API backend + React/Vite frontend, deployed with CI/CD pipelines.

---

## Tech Stack

### Backend (Rails 8 API)
- Ruby on Rails 8 in API-only mode
- PostgreSQL with strong constraints (FKs, uniqueness, non-null)
- JSON:API serialization for frontend contracts
- ActionText for rich recipe directions (sanitized with safelist)
- ActiveStorage for recipe images (with BlobValidator for type/size)
- Authentication: Devise (bcrypt), JWT support, 2FA (TOTP)
- Authorization: Pundit (role-based policies: admin, creator, reader)
- Security: Rack::Attack (rate limiting), Brakeman (static analysis), parameter whitelisting
- Background Jobs: Sidekiq (queued mailers, async tasks)
- Service Layer + Concerns for business logic

### Frontend (React + Vite)
- React 18 with Vite bundler
- TypeScript enforced for maintainability
- TailwindCSS + Shadcn UI for reusable, enterprise-quality components
- React Query for API data fetching, caching, retries
- React Router for navigation
- Form validation with Zod
- Jest + React Testing Library for unit tests
- Cypress for end-to-end tests

### Hybrid Integration
- Rails exposes **API-first services** consumed by React
- CORS configured for local dev + production origins
- Shared `.env` values for `VITE_API_URL` → Rails endpoints
- CI/CD pipelines test both Rails and React before merge
- Docker Compose orchestrates Postgres + future services (API, web, workers)

### DevOps & Tooling
- GitHub Actions (CI/CD) for Rails + React
- RuboCop & ESLint/Prettier for consistent style
- Brakeman (Rails security scanner)
- Dependabot for dependency updates
- Docker Compose for local Postgres, dev services
- ADRs + Business Logic Docs in `/docs`


---

## Getting Started

### Prerequisites
- Ruby 3.3+ and Rails 8  
- Node 20+  
- PostgreSQL 14+ (local or Docker)  

### Setup

```bash
# Clone the repo
git clone https://github.com/aaronbishop/three-peas-in-a-pod.git
cd three-peas-in-a-pod

# API setup
cd api
bundle install
bin/rails db:create db:migrate
bin/rails s

# Frontend setup
cd ../web
npm install
npm run dev
