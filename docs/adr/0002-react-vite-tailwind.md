# ADR-0002: Use React 18 + Vite + Tailwind frontend

**Status:** Accepted

## Context
The application will use a hybrid approach: Rails 8 provides the backend and JSON APIs, while React 18 will handle the main user-facing frontend. Rails retains the ability to render server-side views if needed (e.g., admin interfaces, email previews, fallbacks). React is chosen to deliver a responsive SPA experience, with Vite for modern build tooling and Tailwind for consistent styling.

## Decision
We will implement the primary user interface using React 18 with Vite as the bundler/build tool, and Tailwind CSS for styling. Rails will continue to serve JSON APIs and may support limited server-rendered views for specific use cases.

## Consequences
- **Positive:**  
  - Fast developer experience with Vite  
  - Enterprise adoption of React, recruiter familiarity  
  - Tailwind utility classes provide consistent styling  
  - Rails remains available for hybrid server-rendered needs  
- **Negative:**  
  - Requires clear separation of Rails routes vs React SPA routes  
  - Tailwind can clutter markup if not disciplined  
  - React has a larger bundle size compared to lighter frameworks  
- **Alternatives:**  
  - Angular, Vue, or Svelte. Chosen React for ecosystem, team/recruiter familiarity, and flexibility with Rails hybrid.
