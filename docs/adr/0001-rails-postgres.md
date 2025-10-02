# ADR-0001: Use Rails 8 with Postgres (Full Mode, JSON APIs)

**Status:** Accepted

## Context
We need a backend framework that supports robust domain modeling, rich text, and file uploads while providing JSON APIs for a React frontend. Rails 8 offers modern defaults, security features, and a mature ActiveRecord ORM. Postgres provides reliability, indexing, and enterprise adoption.

## Decision
We will use Rails 8 in full mode (not API-only), exposing JSON APIs as the primary interface. This ensures flexibility for hybrid approaches, including server-rendered views if needed.

## Consequences
- **Positive:**  
  - Full Rails stack available (views, ActionText, ActiveStorage, mailers)
  - JSON APIs work seamlessly with React frontend
  - Flexibility for hybrid rendering or admin-only views in future
- **Negative:**  
  - Slightly larger footprint than API-only mode  
  - Must ensure frontend-only routes and backend views don’t conflict  
- **Alternatives:**  
  - Rails API-only + React → Leaner, but less flexible  
  - Django + Postgres → Similar enterprise maturity, but weaker ecosystem for ActionText-style features  
  - Express.js + Node → Lighter, but weaker ORM and enterprise discipline
