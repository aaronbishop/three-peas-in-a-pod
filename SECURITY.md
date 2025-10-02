# Security Policy

## Reporting a Vulnerability
If you discover a security vulnerability, please report it responsibly.

- Do not open public issues for security concerns.
- Instead, email: [your contact email or GitHub profile link]

We will acknowledge receipt and investigate promptly.

## Security Scans
Dependencies are scanned regularly as part of CI/CD:
- Ruby: `bundler audit`
- Node.js: `npm audit`

Scans are informational in this project but demonstrate enterprise workflow hygiene.

## Branch Protection
The `main` branch is protected with:
- Required pull requests before merging
- Direct commits to `main` are disallowed
- Linear history is enforced (squash/rebase only, no merge commits)
- Deletions of `main` are disallowed
- Force pushes to `main` are blocked
- No bypasses are configured (equivalent to including administrators)
- Status checks will be required once CI/CD is configured