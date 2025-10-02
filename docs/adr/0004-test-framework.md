# ADR-0004: Choose RSpec for Testing Framework

**Status:** Accepted

## Context
Rails defaults to Minitest, which is lightweight and built-in. However, enterprise Rails teams commonly use RSpec due to its rich DSL, ecosystem, and readability for behavior-driven tests. This project aims to demonstrate enterprise-grade practices while being maintained by a solo developer.

## Decision
We will use RSpec as the testing framework, alongside FactoryBot, Faker, and Shoulda Matchers for factories, test data, and expressive model/controller matchers.

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
