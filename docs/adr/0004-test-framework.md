# ADR-0004: Choose RSpec for Testing Framework

**Status:** Accepted

## Context
Rails defaults to Minitest, which is lightweight and built-in. However, enterprise Rails teams commonly use RSpec due to its rich DSL, ecosystem, and readability for behavior-driven tests.  
This project aims to demonstrate enterprise-grade practices while being maintained by a solo developer.

## Decision
We will use RSpec as the primary testing framework, alongside FactoryBot, Faker, and Shoulda Matchers for factories, test data, and expressive model/controller matchers.

## Consequences
- **Positive:**  
  - Familiar to enterprise teams and recruiters  
  - Large ecosystem of gems and plugins  
  - Readable DSL for specs (`describe`, `context`, `it`)
- **Negative:**  
  - Heavier than Minitest  
  - Slightly slower startup times compared to built-in Minitest
- **Alternatives:**  
  - **Minitest** → Lightweight, included by default, but less enterprise optics  
  - **TestUnit/other DSLs** → Rare in Rails, little ecosystem support  

---

## Amendments (2025-10-05)

As part of Issue #42 (*Setup RSpec Stack*), the RSpec configuration was expanded to support the full enterprise test pipeline used in a hybrid Rails 8 + React/Vite application.

### Additions
- **`database_cleaner-active_record`** → Ensures consistent transactional isolation between examples and supports multi-process JS/system tests.  
- **`timecop`** → Enables deterministic testing for time-sensitive logic such as JWT token expiry, refresh, and clock-skew handling.  
- **`simplecov`** → Provides coverage reporting and enforces a minimum threshold (≥ 90 %).  
- **RSpec support helpers** for FactoryBot, Shoulda Matchers, DatabaseCleaner, and Timecop were added under `spec/support/`.  
- **Smoke test** (`spec/requests/root_spec.rb`) verifies RSpec initialization via CI.

### Rationale
These additions align with the project’s hybrid architecture and future CI/CD workflow. They ensure the backend test suite remains deterministic, isolated, and measurable, supporting both backend and upcoming frontend integration tests.

### Impact
- Improves test reliability and reproducibility.  
- Establishes a scalable baseline for continuous integration and code-quality metrics.  
- Requires maintaining an additional few gems but significantly increases enterprise optics and maintainability.
