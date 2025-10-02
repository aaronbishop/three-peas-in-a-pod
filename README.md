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

## Project Board

We track all work in the [Three Peas Project Board](https://github.com/users/aaronbishop/projects/3).

### Workflow & Status Flow
Issues automatically move across the board via GitHub Project workflows:

- **Item added →** Status = Backlog  
- **Item closed →** Status = Done  
- **Item reopened →** Status = Backlog  
- **Pull request merged (linked to issue) →** Status = Done  
- **Sub-issues (checklist children) →** Automatically added to the project

Columns represent the delivery flow with WIP limits:
- **Backlog** (unlimited)  
- **Ready for Dev** (max 5)  
- **In Progress** (max 2–3)  
- **Testing** (max 1–2)  
- **Done** (unlimited)  

### Labels
- **Epics:** `epic: foundation`, `epic: authentication`, `epic: recipes`, `epic: social`, `epic: deployment`  
- **Work types:** `feat`, `fix`, `chore`, `docs`, `test`

### Milestones
- **Foundation**  
- **MVP**  
- **Social Features**  
- **Deployment**

### Notes
- Epics are represented as issues with checklists. Sub-issues auto-populate into the board when linked.  
- The “Code changes requested” workflow is not enabled for this project, since development is currently solo — but the configuration is ready to scale if contributors join.

## Estimation Guidelines

We use T-shirt sizing to estimate issue complexity:

- **S** – Small (≤ 2 hours)
- **M** – Medium (≤ 1 day)
- **L** – Large (2–3 days)
- **XL** – Extra Large (1 week+)

Estimates are relative, not exact time commitments. They are intended to:

- Provide guidance for prioritization and capacity planning  
- Track progress across epics in a consistent way  
- Encourage discipline in sizing work before implementation begins  

Each issue in the Project board includes an **Estimate** field using this scale.

## Repository Conventions

To maintain consistency and enterprise-grade workflow practices, all work in this repository follows the conventions below.

### Branch Naming
Branches are prefixed by work type:

- `feat/...` – New features
- `fix/...` – Bug fixes
- `chore/...` – Maintenance, tooling, configs, automation
- `docs/...` – Documentation updates only
- `test/...` – Test coverage changes

### Commit Messages
Commit messages follow the [Conventional Commits](https://www.conventionalcommits.org/) style:

- **Format:** `type(scope): subject`
- **Subject:** Short, imperative, ≤ 72 characters
- **Body (optional):** Additional context or rationale
- **Footer (optional):** `Closes #XX` to link and close issues

Examples:

feat(auth): add JWT-based login flow
fix(recipes): correct null check for ingredient list
chore(ci): update GitHub Actions cache key

### Pull Requests
- PRs must use the standardized template
- PRs should be squash-merged with a clean commit message
- PR descriptions must link related issues (`Closes #XX`)
- Each PR should include testing notes and any known risks/limitations

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
