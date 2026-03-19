# FUSE - Spec-Driven AI Orchestration for OpenCode

**FUSE** (Fully Unified Software Engine) - Self-improving workflow orchestration that learns from mistakes.

> **Inspiration**: FUSE takes inspiration from [OpenAgentsControl by Darren Hide](https://github.com/darrenhinde/OpenAgentsControl), an excellent project that provides structured workflows for OpenCode. FUSE extends this with spec-driven development principles, dynamic questioning, and self-improvement capabilities.

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
curl -fsSL https://raw.githubusercontent.com/BandiAkarsh/fuse-openclode-plugin/main/install.sh | bash
```

### Or with options:

```bash
# Check what would be installed first
curl -fsSL https://raw.githubusercontent.com/BandiAkarsh/fuse-openclode-plugin/main/install.sh -o install.sh
bash install.sh --dry-run

# Install everything
bash install.sh
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
│  4. Plan minimal changes (don't break existing)     │
│  5. Implement incrementally                         │
│  6. Test against original functionality             │
└─────────────────────────────────────────────────────┘
```

## Tools

| Tool | Purpose |
|------|---------|
| `fuse_analyze` | Analyze task complexity with memory integration |
| `fuse_check_project` | Auto-invoke ContextScout for project analysis |
| `fuse_create_spec` | Generate SPEC.md with smart questions |
| `fuse_log_correction` | Log mistakes for self-improvement |
| `fuse_status` | Show current status + learned corrections |
| `fuse_update` | Handle update/modification scenarios |

## Dynamic Spec System

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

AI: "Creating SPEC and building now..."
```

### Key Principles

| Principle | Description |
|-----------|-------------|
| **START BROAD** | Don't assume tech stack |
| **FOLLOW UP** | One answer leads to next smart question |
| **RECOMMEND** | If user says "I don't know", make a decision |
| **SUMMARIZE** | Confirm before building |

## Auto-Agent Invocation

FUSE automatically invokes the right agents based on context:

- **"check this project"** → Auto-invokes ContextScout
- **"create full-stack app"** → Auto-invokes TaskManager + specialists
- **"fix bug in existing code"** → Auto-invokes update workflow

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
├── fuse-plugin.json        # Plugin manifest
├── registry.json          # Component registry
├── dist/                  # Built plugin (JS)
│   └── index.js
├── src/                   # Source code
├── .opencode/             # Agents & context
│   ├── agent/              # OpenAgent, OpenCoder, subagents
│   └── context/           # Standards, workflows
└── docs/                  # Documentation
    ├── SPEC_WIZARD.md
    └── UPDATE_WORKFLOW.md
```

## Requirements

- OpenCode CLI
- Node.js 18+ (for plugin)
- Bash 3.2+

## License

MIT

---

*"The magic isn't in the vibes. It's in knowing exactly what you want and expressing it clearly."* — adapted from Red Hat Developers
