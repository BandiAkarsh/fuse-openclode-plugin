# FUSE Spec Workflow

## When to Use

When user asks to create/build a new project or feature.

## The FUSE Spec Creation Flow

```
┌─────────────────────────────────────────────────────────────┐
│                    SPEC WIZARD                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  PHASE 1: PROJECT TYPE (Quick)                              │
│  ─────────────────────────────────                         │
│  What are we building?                                      │
│  □ Web Application                                          │
│  □ API/Backend Service                                      │
│  □ Mobile App                                               │
│  □ Desktop App                                              │
│  □ CLI Tool                                                 │
│  □ Library/Package                                          │
│  □ Other (describe)                                         │
│                                                             │
│  PHASE 2: STACK SELECTION (Medium)                          │
│  ───────────────────────────────────                        │
│  Frontend: React / Vue / Svelte / Angular / Vanilla JS     │
│  Backend: Node.js / Python / Go / Rust / Java               │
│  Database: PostgreSQL / MySQL / MongoDB / SQLite / None    │
│  Auth: JWT / OAuth / Session / None                        │
│  State: Redux / Zustand / Context / None                   │
│  Styling: Tailwind / CSS Modules / Styled-Components       │
│                                                             │
│  PHASE 3: CORE FEATURES (Important)                        │
│  ──────────────────────────────────                         │
│  □ User Authentication (signup/login/logout)               │
│  □ User Profiles (name, avatar, settings)                   │
│  □ CRUD Operations (create/read/update/delete)              │
│  □ File Upload/Download                                    │
│  □ Search & Filtering                                      │
│  □ Real-time Updates (WebSockets)                          │
│  □ Email/Notifications                                     │
│  □ Payment Integration (Stripe/PayPal)                     │
│  □ Admin Dashboard                                         │
│  □ API for Mobile/External                                 │
│  □ Social Features (comments, likes, shares)               │
│                                                             │
│  PHASE 4: INTEGRATIONS (Check)                              │
│  ────────────────────────────                               │
│  □ External APIs (specify which)                           │
│  □ Third-party services (OAuth providers, etc.)            │
│  □ File storage (S3, Cloudinary, etc.)                     │
│  □ Email service (SendGrid, SES, etc.)                   │
│                                                             │
│  PHASE 5: NON-FUNCTIONAL (Critical for production)          │
│  ─────────────────────────────────────────                  │
│  Performance:                                              │
│  □ Response time < 200ms                                  │
│  □ Handle 100+ concurrent users                            │
│  □ Lazy loading / code splitting                          │
│                                                             │
│  Security:                                                  │
│  □ Input validation (client + server)                      │
│  □ XSS/CSRF protection                                    │
│  □ Rate limiting                                           │
│  □ Parameterized queries                                   │
│                                                             │
│  Scalability:                                               │
│  □ Stateless design                                        │
│  □ Database indexing plan                                  │
│  □ Caching strategy                                        │
│                                                             │
│  PHASE 6: DEPLOYMENT (End goal)                            │
│  ──────────────────────────────────                        │
│  □ Platform: Vercel / AWS / Docker / Heroku / Other      │
│  □ Domain: custom.com / already have domain               │
│  □ SSL: Yes / Let's Encrypt                               │
│  □ CI/CD: GitHub Actions / GitLab CI / None               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Output Format

After gathering info, create SPEC.md:

```markdown
# SPEC.md - [Project Name]

## Overview
[Brief description of what we're building]

## Tech Stack
- Frontend: [Framework]
- Backend: [Framework]  
- Database: [DB]
- Auth: [Method]
- Deploy: [Platform]

## Features

### Must Have (MVP)
- [ ] Feature 1
- [ ] Feature 2

### Nice to Have (v1.1)
- [ ] Feature 3

## Architecture

### Project Structure
```
/
├── src/
│   ├── components/
│   ├── pages/
│   ├── api/
│   └── utils/
├── tests/
└── docs/
```

### Data Model
[ERD or schema description]

### API Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /api/users | List users |
| POST | /api/users | Create user |

## Security
- Input validation with [library]
- SQL injection prevention via [method]
- XSS protection via [method]

## Performance
- Target: <200ms response time
- Lazy loading for routes
- Database indexes on [fields]

## Out of Scope
- [Feature that won't be built]
- [Feature deferred to v2]

---
Created by FUSE Spec Wizard
```

## Decision Tree for Follow-up Questions

### If "Web Application"
- "React, Vue, or Svelte?" (or user preference)
- "SPA or SSR?" (Next.js/Nuxt for SSR)

### If "API/Backend"
- "REST or GraphQL?"
- "Authentication needed?"

### If "Database mentioned"
- "Existing database or new?"
- "Any schema constraints?"

### If "Payment"
- "Stripe, PayPal, or both?"
- "Subscriptions or one-time?"

## Don't Ask About

- Specific file naming (can be decided later)
- CSS pixel-perfect details (can iterate)
- Color choices (unless critical)
- Internal implementation details
- Testing framework (use project default)
