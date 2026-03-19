# FUSE Spec Wizard - Dynamic Questioning Protocol

> **IMPORTANT:** This is NOT a checklist. This is a **CONVERSATION PROTOCOL**.
> Read it to understand the FLOW, then execute dynamically.

## Core Principle

```
❌ BAD:  Ask all questions upfront from a list
✅ GOOD: Ask questions SEQUENTIALLY, let answers guide next questions
```

## The Dynamic Flow

### PHASE 1: Understanding Intent (2-3 questions max)

```
AI: "What would you like to build?"

User: "an online store" / "a blog" / "a dashboard"

AI: "Got it! Is this:"
     a) Something brand new (no existing code)
     b) Adding to an existing project
     c) Migrating/rewriting something

AI: "Any preferences on how we start?"
     a) "You decide the best approach"
     b) "I have specific tech in mind"
     c) "I need recommendations"
```

### PHASE 2A: If User Has Tech Preferences

```
AI: "Great! What technologies are you thinking?"
     (User might say: "React + Node" / "Python with FastAPI" / "just HTML" / etc.)

AI follow-up based on what they said:
     - Said React → "Any preference between Next.js (SSR) or Vite (SPA)?"
     - Said Node → "Express, Fastify, or Hono?"
     - Said Python → "Django, FastAPI, or Flask?"
     - Said "no idea" → Show recommendations based on use case
```

### PHASE 2B: If User Says "You Decide"

```
AI: "Perfect! Then I'll recommend based on your needs."

Questions to guide recommendations:
1. "Scale expectations?" (personal/small biz/enterprise)
2. "Real-time features needed?" (chat, notifications, live updates)
3. "Existing team skills?" (what languages/frameworks does your team know?)
4. "Deployment preferences?" (serverless, container, managed platform)
```

### PHASE 3: Features (What they actually need)

```
AI: "What features are essential vs nice-to-have?"

Start with common features based on project type:
     - Blog → "Posts, comments, categories, search?"
     - Store → "Products, cart, checkout, user accounts?"
     - Dashboard → "Charts, tables, filters, exports?"

Let user ADD features, don't force from list.
```

### PHASE 4: Constraints (Deal-breakers)

```
AI: "Any constraints I should know about?"

Common constraints to probe:
- "Database size?" (KB, MB, GB, TB scale)
- "Security requirements?" (PII, PCI, HIPAA)
- "Performance targets?" (100 users, 10K, 1M?)
- "Browser support?" (modern only, IE11?)
- "Mobile responsive?" (must-have or desktop-only okay)
```

### PHASE 5: Deployment/Delivery

```
AI: "How should this be deployed?"

Questions:
- "Self-hosted, managed platform, or serverless?"
- "Domain ready or starting fresh?"
- "Need CI/CD from day one?"
```

## Decision Tree (Dynamic Branching)

```
User: "I want to build a project management tool"

├── If no preferences stated:
│   ├── Scale? "Small team (5-20)" → Recommend: Next.js + Supabase
│   ├── Scale? "Growing (50-200)" → Recommend: Next.js + PostgreSQL
│   └── Scale? "Enterprise (200+)" → Recommend: Existing stack + consultation
│
├── If specific DB mentioned:
│   ├── Mentioned "Postgres" → "Prisma or Drizzle?"
│   ├── Mentioned "Mongo" → "Mongoose or Prisma?"
│   └── Mentioned "SQLite" → "tRPC or REST?"
│
└── If auth mentioned:
    ├── → "Existing auth provider (Auth0, Clerk) or custom?"
    └── → "Social logins needed?"
```

## Questions to ALWAYS Ask (But NOT upfront)

```
Don't ask all at once. Ask when relevant:

1. "Existing codebase?" → determines NEW vs UPDATE workflow
2. "Team size?" → determines collaboration needs
3. "Budget?" → determines hosting/infrastructure
4. "Timeline?" → determines MVP scope
```

## Questions to NEVER Ask

```
✗ "React or Vue?" (if user didn't mention frontend)
✗ "PostgreSQL or MySQL?" (if user didn't mention DB)
✗ "Docker or Kubernetes?" (if deployment wasn't mentioned)
✗ Any technology not mentioned by user or implied by project type
```

## Smart Follow-up Examples

### Example 1: User says "an API"
```
AI: "REST or GraphQL?"

User: "REST"

AI: "Got it. Authentication?"

User: "yes"

AI: "JWT tokens or session-based?"

User: "jwt"

AI: "Any rate limiting or caching needs?"

(User can skip these)
```

### Example 2: User says "a social app"
```
AI: "Cool! Features like?"

User: "user profiles, followers, posts"

AI: "Any real-time needs? (live comments, notifications)"

User: "maybe notifications"

AI: "Private or public profiles?"

User: "user choice"

AI: "Mobile apps or just web?"
```

### Example 3: User says "a simple landing page"
```
AI: "Static or dynamic content?"

User: "mostly static, maybe a contact form"

AI: "Got it. Any analytics needed?"

User: "no"

AI: "Perfect. Then this is straightforward - I'll build a fast, static site."
```

## The Golden Rules

```
1. START BROAD, go narrow
   - Don't assume tech stack
   - Let user mention technologies first

2. ONE decision leads to next
   - Tech choice → "Good choice. What ORMs/DB?"

3. IF user says "idk" → RECOMMEND
   - Don't endless questions
   - Make a decision and explain why

4. IF user says "whatever works" → CHOOSE DEFAULT
   - Defaults: React, Node, Postgres, Vercel

5. ALWAYS explain your questions
   - "This helps me recommend the right stack"

6. SUMMARIZE before building
   - "So we're building: [X] with [Y] targeting [Z]"
```

## Output: The SPEC (After Questions)

After dynamic conversation, create SPEC.md:

```markdown
# [Project Name]

## Summary
[Brief 1-2 sentence description]

## Tech Stack
- Frontend: [X] (chosen by user or recommended)
- Backend: [X] (chosen by user or recommended)
- Database: [X] (chosen by user or recommended)
- Auth: [X] (if needed)
- Deploy: [X] (chosen or recommended)

## Features

### Must Have
- [ ] Feature 1
- [ ] Feature 2

### Out of Scope (v1)
- [ ] Feature deferred

## Constraints Met
- Scale: [X]
- Performance: [X]
- Security: [X]

---
*Built with FUSE - Questions adapted to your needs*
```

## Anti-Patterns to Avoid

```
❌ Rigid checklist asking all questions upfront
❌ Listed technologies forcing user to pick from list
❌ "What about this specific library?" without context
❌ Endless questions without making decisions
❌ Assuming scale/enterprise needs without asking
```

---

## For Update/Modify Requests

**Different flow!** See `UPDATE_WORKFLOW.md`

For updates, the flow is:
1. What needs changing?
2. Understand existing code (READ IT)
3. Minimal change plan
4. Implement & test

NOT the same as new project creation.
