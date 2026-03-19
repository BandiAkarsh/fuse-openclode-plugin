# FUSE - Spec-Driven AI Orchestration for OpenCode

**FUSE** (Fully Unified Software Engine) - Self-improving workflow orchestration that learns from mistakes.

> **Inspiration**: FUSE takes inspiration from [OpenAgentsControl by Darren Hide](https://github.com/darrenhinde/OpenAgentsControl), an excellent project that provides structured workflows for OpenCode. FUSE extends this with spec-driven development principles, dynamic questioning, and self-improvement capabilities.

## Why FUSE Isn't Visible Right Now

⚠️ **FUSE only works inside OpenCode TUI!** 

This conversation is NOT in OpenCode - it's a regular chat interface. FUSE is a plugin that:

1. **Installs into OpenCode** → `/home/akarsh/.config/opencode/plugin/`
2. **Works inside OpenCode TUI** → `opencode` command
3. **Provides tools** → `fuse_analyze`, `fuse_create_spec`, etc.

To use FUSE:
```bash
# Install OpenCode first
opencode

# Then FUSE works automatically!
```

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
curl -fsSL https://raw.githubusercontent.com/BandiAkarsh/fuse-opencode-plugin/main/install.sh | bash
```

### Or with options:

```bash
# Install with fuse plugin
curl -fsSL https://raw.githubusercontent.com/BandiAkarsh/fuse-opencode-plugin/main/install.sh | bash -s fuse

# Check what would be installed first
curl -fsSL https://raw.githubusercontent.com/BandiAkarsh/fuse-opencode-plugin/main/install.sh -o install.sh
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
curl -fsSL https://raw.githubusercontent.com/BandiAkarsh/fuse-opencode-plugin/main/dist/index.js \
  -o ~/.config/opencode/plugin/fuse.js

# Step 4: Download plugin manifest
curl -fsSL https://raw.githubusercontent.com/BandiAkarsh/fuse-opencode-plugin/main/fuse-plugin.json \
  -o ~/.config/opencode/plugin/fuse-plugin.json

# Step 5: Update opencode.json
# Add to plugins array in ~/.config/opencode/opencode.json:
# {
#   "plugins": ["~/.config/opencode/plugin/fuse.js"]
# }

# Step 6: Restart OpenCode
```

## Dynamic Spec System (Not a Rigid Checklist!)

FUSE is **intelligent** - it asks questions SEQUENTIALLY based on your responses, not a rigid checklist.

### How It Works

```
❌ BAD (rigid checklist): "Pick from this list: React? Vue? Angular?"
✅ GOOD (dynamic): "Any tech preferences?" → Follow up based on answer
```

### Example Conversation

```
User: "build me an online store"

AI: "Got it! Is this brand new or adding to existing?"
User: "new"

AI: "Cool! Any specific technologies in mind?"
User: "no idea, you decide"

AI: "I'd recommend Next.js + Stripe + Supabase.
     Fast development, easy payments, handles auth.
     Sound good?"
User: "yes"

AI: "Features?"
User: "products, cart, checkout, user accounts"

AI: "Real-time inventory tracking?"
User: "not needed for now"

AI: "Perfect! Creating SPEC and building now..."
```

### Key Principles

| Principle | Description |
|-----------|-------------|
| **START BROAD** | Don't assume tech stack |
| **FOLLOW UP** | One answer leads to next smart question |
| **RECOMMEND** | If user says "I don't know", make a decision |
| **SUMMARIZE** | Confirm before building |

### Smart Branching

FUSE detects project type and asks relevant follow-ups:

| Project Type | Smart Questions |
|-------------|----------------|
| E-commerce | "Physical or digital products?" |
| Blog/CMS | "Who creates content?" |
| API | "REST or GraphQL?" |
| Dashboard | "Real-time updates needed?" |
| App | "Web, mobile, or desktop?" |

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
