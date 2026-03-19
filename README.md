# FUSE - Spec-Driven AI Orchestration for OpenCode

**FUSE** (Fully Unified Software Engine) - Self-improving workflow orchestration that learns from mistakes.

## The Problem

AI coding tools generate code fast, but:

```
Vibe Coding = Fast chaos
- Code works initially
- Breaks at 3-month mark
- "Fix one thing, break ten others"
- No map back to stable version
```

## The Solution

```
FUSE = Fast + SPEC
- SPEC.md first (what, not how)
- Agent chains for complex tasks
- Learn from mistakes
- Never repeat the same error twice
```

## Quick Install (One Command)

```bash
curl -fsSL https://raw.githubusercontent.com/pixelsmon/fuse-opencode-plugin/main/install.sh | bash
```

### Or with options:

```bash
# Install with fuse plugin
curl -fsSL https://raw.githubusercontent.com/pixelsmon/fuse-opencode-plugin/main/install.sh | bash -s fuse

# Check what would be installed first
curl -fsSL https://raw.githubusercontent.com/pixelsmon/fuse-opencode-plugin/main/install.sh -o install.sh
bash install.sh --dry-run
```

## What FUSE Does

### 1. Spec-Driven Workflow

| Scope | Approach | When |
|-------|----------|------|
| Explore/Prototype | VIBE OK | Small, isolated |
| Ship/Maintain | SPEC REQUIRED | Anything you'll keep |
| Complex Systems | SPEC → TaskManager → Agents | Multi-component |

### 2. Self-Improvement

```
Task → Success? → Log to memory
              ↓ No
        Log mistake → Future tasks get warnings
```

### 3. Update-Aware

When you ask to modify existing code:

```
┌─────────────────────────────────────────────────────┐
│  "Update the login system"                          │
│                                                     │
│  1. Read existing code                              │
│  2. Understand current architecture                  │
│  3. Create SPEC for changes                         │
│  4. Plan minimal changes (don't break existing)    │
│  5. Implement incrementally                         │
│  6. Test against original functionality             │
└─────────────────────────────────────────────────────┘
```

## For AI Models (Install Instructions)

When a user asks you to install FUSE:

```bash
# Step 1: Check if OpenCode is installed
which opencode || echo "OpenCode not found"

# Step 2: Create plugin directory
mkdir -p ~/.config/opencode/plugin

# Step 3: Download plugin
curl -fsSL https://raw.githubusercontent.com/pixelsmon/fuse-opencode-plugin/main/dist/index.js \
  -o ~/.config/opencode/plugin/fuse.js

# Step 4: Download plugin manifest
curl -fsSL https://raw.githubusercontent.com/pixelsmon/fuse-opencode-plugin/main/fuse-plugin.json \
  -o ~/.config/opencode/plugin/fuse-plugin.json

# Step 5: Update opencode.json
# Add to plugins array in ~/.config/opencode/opencode.json:
# {
#   "plugins": ["~/.config/opencode/plugin/fuse.js"]
# }

# Step 6: Restart OpenCode
```

## Detailed Spec System (More Than 3 Questions)

FUSE asks smart questions based on task type:

### For NEW Projects

```
┌─────────────────────────────────────────────────────────┐
│  PROJECT CREATION WIZARD                                │
├─────────────────────────────────────────────────────────┤
│  1. PROJECT TYPE                                        │
│     □ Web App (React/Vue/Angular)                      │
│     □ API/Backend (Node/Python/Go)                     │
│     □ Mobile App (React Native/Flutter)                │
│     □ Desktop App (Electron/Tauri)                     │
│     □ CLI Tool                                         │
│     □ Library/Package                                  │
│                                                         │
│  2. STACK (select all that apply)                      │
│     □ Frontend: React / Vue / Svelte / Angular         │
│     □ Backend: Node / Python / Go / Rust                │
│     □ Database: PostgreSQL / MongoDB / SQLite          │
│     □ Auth: JWT / OAuth / Session                      │
│     □ State: Redux / Zustand / Jotai                   │
│                                                         │
│  3. FEATURES (select all needed)                       │
│     □ User Authentication                              │
│     □ Real-time (WebSockets)                          │
│     □ File Upload/Download                             │
│     □ Email/Notifications                              │
│     □ Payment Integration                              │
│     □ Admin Dashboard                                  │
│     □ API for Mobile/External                          │
│                                                         │
│  4. DEPLOYMENT TARGET                                   │
│     □ Vercel/Netlify (Static/SSR)                     │
│     □ Docker/Cloud (Backend)                           │
│     □ Mobile Stores (iOS/Android)                      │
│     □ Self-hosted                                      │
│                                                         │
│  5. NON-FUNCTIONAL REQUIREMENTS                        │
│     □ Performance: <200ms response time               │
│     □ Scalability: 1000+ concurrent users              │
│     □ Security: SOC2 / GDPR compliance                 │
└─────────────────────────────────────────────────────────┘
```

### For UPDATE Projects

```
┌─────────────────────────────────────────────────────────┐
│  UPDATE WIZARD (when modifying existing code)          │
├─────────────────────────────────────────────────────────┤
│  1. WHAT TO UPDATE                                      │
│     □ Add new feature                                   │
│     □ Modify existing feature                           │
│     □ Fix bug                                           │
│     □ Improve performance                               │
│     □ Refactor/cleanup                                 │
│     □ Add tests                                        │
│                                                         │
│  2. AFFECTED AREAS                                      │
│     □ Frontend only                                    │
│     □ Backend only                                     │
│     □ Both frontend and backend                         │
│     □ Database schema changes                          │
│     □ API changes (breaking?)                          │
│                                                         │
│  3. CONSTRAINTS (critical to preserve)                  │
│     □ Don't break existing API endpoints               │
│     □ Don't change database schema                     │
│     □ Must maintain backward compatibility             │
│     □ Performance must not degrade                     │
│                                                         │
│  4. RISK ASSESSMENT                                     │
│     □ Low risk (isolated change)                       │
│     □ Medium risk (affects multiple features)          │
│     □ High risk (core functionality)                   │
└─────────────────────────────────────────────────────────┘
```

## Tools

| Tool | Purpose |
|------|---------|
| `fuse_analyze` | Analyze task complexity with memory integration |
| `fuse_create_spec` | Generate SPEC.md with smart questions |
| `fuse_log_correction` | Log mistakes for self-improvement |
| `fuse_status` | Show current status + learned corrections |
| `fuse_update` | Handle update/modification scenarios |

## Workflow Examples

### New Project

```bash
> "Create an ecommerce platform"

FUSE: "I'll help you build an ecommerce platform. Quick questions:"

1. What type of store?
   a) Physical products
   b) Digital products
   c) Services/subscriptions
   
2. Any existing integrations?
   a) Payment: Stripe / PayPal / Both
   b) Shipping: Manual / Real-time rates
   
3. What features are critical?
   a) User accounts + wishlists
   b) Inventory management
   c) Order tracking
   d) Admin dashboard

YOU: "a, Stripe, a and b"

✅ SPEC created. Building your ecommerce platform...
```

### Update Existing

```bash
> "Add user profiles to the login system"

FUSE: "I'll add user profiles. Quick questions:"

1. Profile fields needed?
   a) Basic (name, avatar, bio)
   b) Social links
   c) Preferences/settings
   
2. Profile visibility?
   a) Public (anyone can view)
   b) Private (only owner)
   c) Friends-only
   
3. Avatar upload?
   a) Yes (with crop/resize)
   b) No (URL only)

YOU: "a and b, a, yes"

✅ SPEC created. Analyzing existing login system...
✅ Reading current auth implementation...
✅ Planning minimal changes...
✅ Adding profiles without breaking login...
```

## Comparison

| Feature | Vibe Coding | FUSE |
|---------|-------------|------|
| Speed (initial) | Fast | Fast |
| Speed (3 months later) | Slow (chaos) | Fast (spec maintained) |
| Maintenance | Hard | Easy |
| Trust Debt | High | Low |
| Self-Improvement | None | Learns from mistakes |

## Files

```
fuse-opencode-plugin/
├── README.md              # This file
├── install.sh             # One-command installer
├── fuse-plugin.json       # Plugin manifest
├── registry.json          # Component registry
├── dist/                  # Built plugin (JS)
│   └── index.js
├── src/                   # Source code
│   ├── index.ts          # Main plugin
│   └── ...
└── docs/                  # Documentation
    ├── SPEC_WIZARD.md    # Detailed spec questions
    └── UPDATE_WORKFLOW.md # Update handling
```

## Requirements

- OpenCode CLI
- Node.js 18+ (for plugin)
- Bash 3.2+

## License

MIT

---

**Built with the insight that:** *"The magic isn't in the vibes. It's in knowing exactly what you want and expressing it clearly."* — adapted from Red Hat Developers
