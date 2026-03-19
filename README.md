# 🔥 FUSE - Spec-Driven AI Orchestration

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![OpenCode](https://img.shields.io/badge/OpenCode-Plugin-blue.svg)](https://opencode.ai)
[![Stars](https://img.shields.io/github/stars/BandiAkarsh/fuse-openclode-plugin?style=social)](https://github.com/BandiAkarsh/fuse-openclode-plugin/stargazers)
[![Forks](https://img.shields.io/github/forks/BandiAkarsh/fuse-openclode-plugin?style=social)](https://github.com/BandiAkarsh/fuse-openclode-plugin/network/members)

> **FUSE** (Fully Unified Software Engine) — Self-improving workflow orchestration that learns from mistakes and prevents the "3-month chaos" of vibe coding.

*Inspired by [OpenAgentsControl](https://github.com/darrenhinde/OpenAgentsControl) by Darren Hide*

---

## 🚀 Quick Start

```bash
# One-command installation
curl -fsSL https://raw.githubusercontent.com/BandiAkarsh/fuse-openclode-plugin/main/install.sh | bash
```

That's it! Restart OpenCode and FUSE is ready.

---

## 🎯 What FUSE Solves

| Problem with Vibe Coding | FUSE Solution |
|------------------------|---------------|
| 😱 Code breaks at 3-month mark | 📋 SPEC.md first |
| 🐛 Fix one thing, break ten | 🔗 Agent chains |
| 📉 Speed degrades over time | 🧠 Learns from mistakes |
| ❌ Same errors repeated | 💾 Memory persistence |

---

## ✨ Features

### 1. 🏗️ Spec-Driven Workflow
```
┌────────────────────────────────────────────────────────┐
│  Explore/Prototype  →  VIBE OK (small, isolated)      │
│  Ship/Maintain     →  SPEC REQUIRED                   │
│  Complex Systems   →  SPEC → TaskManager → Agents     │
└────────────────────────────────────────────────────────┘
```

### 2. 🧠 Self-Improvement
```
Task → Success? → Log to memory
              ↓ No
        Log mistake → Future tasks get warnings
```

### 3. 🔄 Update-Aware
Safe modifications to existing code with minimal changes.

---

## 🛠️ Tools

| Tool | Purpose |
|------|---------|
| `fuse_analyze` | Analyze task complexity with memory integration |
| `fuse_check_project` | Auto-invoke ContextScout for project analysis |
| `fuse_create_spec` | Generate SPEC.md with dynamic questions |
| `fuse_log_correction` | Log mistakes for self-improvement |
| `fuse_status` | Show current status + learned corrections |
| `fuse_update` | Handle update/modification scenarios |

---

## 📖 Usage Examples

### Create New Project

```
> "build me an online store"

AI: "Got it! Is this brand new or adding to existing?"
You: "new"

AI: "Cool! Any specific technologies in mind?"
You: "no idea, you decide"

AI: "I'd recommend Next.js + Stripe + Supabase. Sound good?"
You: "yes"

AI: "Features?"
You: "products, cart, checkout"

AI: "Creating SPEC and building now..."
```

### Update Existing Code

```
> "add user profiles to the login system"

AI: "I'll add profiles. Quick questions..."
AI: "✓ Analyzing existing login..."
AI: "✓ Planning minimal changes..."
AI: "✓ Adding profiles without breaking login..."
```

---

## 🎨 Dynamic Spec System

FUSE asks questions **sequentially based on your answers** — not a rigid checklist:

```
❌ BAD: "Pick from list: React? Vue? Angular?"
✅ GOOD: "Any tech preferences?" → Follow up based on answer
```

### Smart Branching

| Project Type | FUSE Asks |
|-------------|-----------|
| 🛒 E-commerce | "Physical or digital products?" |
| 📝 Blog/CMS | "Who creates content?" |
| 🔌 API | "REST or GraphQL?" |
| 📊 Dashboard | "Real-time updates needed?" |

---

## 🔗 Auto-Agent Invocation

FUSE automatically calls the right agents:

| User Says | FUSE Does |
|-----------|-----------|
| `"check this project"` | Invokes ContextScout |
| `"create full-stack app"` | Invokes TaskManager + specialists |
| `"fix bug"` | Invokes update workflow |

---

## 📁 Project Structure

```
fuse-openclode-plugin/
├── 📜 README.md              # This file
├── 🔧 install.sh             # One-command installer
├── ⚙️  fuse-plugin.json        # Plugin manifest
├── 📦 dist/
│   └── 🚀 index.js           # Built plugin
├── 📚 docs/
│   ├── 📋 SPEC_WIZARD.md    # Spec creation guide
│   └── 🔄 UPDATE_WORKFLOW.md # Update handling
├── 🤖 .opencode/
│   ├── 👤 agent/             # OpenAgent, OpenCoder
│   │   └── core/
│   └── 📖 context/           # Standards, workflows
└── 📊 registry.json          # Component registry
```

---

## 📋 Requirements

| Requirement | Version |
|-------------|---------|
| OpenCode CLI | Latest |
| Node.js | 18+ |
| Bash | 3.2+ |

---

## 🤝 Contributing

Contributions welcome! Please read the docs and follow the spec-driven workflow.

---

## 📜 License

MIT License - see [LICENSE](LICENSE)

---

## 🙏 Credits

- **[Darren Hide](https://github.com/darrenhinde)** - Creator of [OpenAgentsControl](https://github.com/darrenhinde/OpenAgentsControl) which inspired FUSE
- **[Red Hat Developers](https://developers.redhat.com)** - Article on vibe coding that inspired spec-driven development

---

<p align="center">
  <strong>Built with the insight that:</strong><br>
  <em>"The magic isn't in the vibes. It's in knowing exactly what you want."</em>
</p>

<p align="center">
  ⭐ Star this repo if FUSE helped you!<br>
  🔀 Fork it to customize for your workflow!
</p>
