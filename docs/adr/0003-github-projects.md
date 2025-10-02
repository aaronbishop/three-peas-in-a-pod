# ADR-0003: Use GitHub Projects (beta) for project management

**Status:** Accepted

## Context
We need a lightweight but enterprise-grade project management solution integrated with GitHub Issues and PRs. GitHub Projects (beta) provides customizable fields, workflows, and views (board, table, roadmap) without requiring an external tool.

## Decision
We will use GitHub Projects (beta) as the source of truth for backlog management, estimation, epics, and milestones.

## Consequences
- **Positive:**  
  - Native GitHub integration  
  - Automated workflows  
  - Transparent for recruiters and maintainers  
  - Minimal overhead  
- **Negative:**  
  - Fewer features than Jira/Linear (limited reporting, automation quirks)  
- **Alternatives:**  
  - Jira, Linear, Trello. Chosen GitHub Projects due to tight repo integration and solo developer context.
