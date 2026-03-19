# FUSE Update Workflow

## When to Use

When user asks to:
- "Update...", "Modify...", "Change...", "Add to..."
- "Fix...", "Bug...", "Error..."
- "Refactor...", "Improve..."
- "Add feature to existing..."
- ANY modification to existing code

## The Critical Rule

> **NEVER modify existing code without understanding it first.**

## Update Workflow Steps

```
┌─────────────────────────────────────────────────────────────┐
│                 UPDATE WORKFLOW                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  STEP 1: DISCOVER (Understand what exists)                 │
│  ─────────────────────────────────────────                  │
│  □ Read the existing relevant files                        │
│  □ Understand current architecture                         │
│  □ Identify affected components                           │
│  □ Check existing tests                                   │
│                                                             │
│  STEP 2: PLAN (What needs to change)                     │
│  ────────────────────────────────────                      │
│  □ List files that need modification                      │
│  □ Identify potential side effects                        │
│  □ Plan backward-compatible changes                       │
│  □ Identify rollback points                               │
│                                                             │
│  STEP 3: SPEC (What the change should do)                │
│  ─────────────────────────────────────                    │
│  □ Describe the desired behavior                          │
│  □ List acceptance criteria                               │
│  □ Define success/failure conditions                      │
│  □ Document what's NOT changing                           │
│                                                             │
│  STEP 4: IMPLEMENT (Make minimal changes)                │
│  ──────────────────────────────────────                  │
│  □ Make smallest change possible                         │
│  □ Don't refactor unless explicitly asked                │
│  □ Follow existing patterns                              │
│  □ Add tests for the change                              │
│                                                             │
│  STEP 5: VALIDATE (Test thoroughly)                      │
│  ──────────────────────────────────────                  │
│  □ Run existing tests (ensure no regression)            │
│  □ Test the new functionality                            │
│  □ Manual testing if automated tests insufficient        │
│  □ Check for side effects                                │
│                                                             │
│  STEP 6: DOCUMENT (Update docs)                          │
│  ──────────────────────────────────                      │
│  □ Update README if needed                               │
│  □ Update comments in code                               │
│  □ Note any breaking changes                             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Update Types & Special Handling

### 1. Add New Feature to Existing

```
User: "Add user avatars to the existing user system"

FUSE Response:
1. "I'll add avatars. Quick questions:"
   - Avatar size limits?
   - Upload or URL-based?
   - Default avatar for users without one?
   
2. Analyze existing:
   - Read current User model
   - Read current auth/login flow
   
3. Plan minimal changes:
   - Add avatar field to User model
   - Add avatar upload/URL endpoint
   - Update frontend to display avatar
   
4. Implement & test
```

### 2. Fix Bug

```
User: "Fix the login bug when password contains special chars"

FUSE Response:
1. "I'll fix this. Quick questions:"
   - Can you share the error message?
   - When did this start happening?
   - Any recent changes to auth code?
   
2. Investigate:
   - Read auth code
   - Reproduce the bug locally
   
3. Find root cause (not just symptoms)
   - Is it encoding? Validation? SQL?
   
4. Fix minimal issue
   - Add test for this case
   
5. Verify fix works
```

### 3. Refactor/Improve

```
User: "Refactor the API to use classes"

FUSE Response:
1. "I'll help refactor. Questions:"
   - Why refactor? (performance, maintainability, learning?)
   - What pattern to use? (OOP, functional, hybrid?)
   - Any breaking changes allowed?
   
2. Analyze current structure
   - Read all API files
   - Identify patterns already in use
   
3. Plan migration:
   - New structure should mirror old
   - No functional changes, only structural
   
4. Execute incrementally:
   - One class at a time
   - Run tests after each
   
5. Ensure no breaking changes
```

### 4. Add Tests

```
User: "Add tests for the user authentication"

FUSE Response:
1. "I'll add tests. What's the test coverage goal?"
   - Unit tests (isolated functions)
   - Integration tests (API endpoints)
   - E2E tests (full flows)
   
2. Understand current code:
   - Read auth implementation
   - Identify testable functions
   
3. Create tests that:
   - Cover happy path
   - Cover edge cases
   - Mock external dependencies
   - Are maintainable
   
4. Run tests to verify they pass
```

## Safety Checks

### Before ANY Modification

```
☐ Read existing code (don't assume)
☐ Run existing tests (they should pass)
☐ Understand dependencies (what depends on this?)
☐ Plan rollback (can we undo this?)
☐ Check for similar code (DRY violations?)
```

### During Modification

```
☐ Make small, incremental changes
☐ Run tests after each change
☐ Don't change what's not asked
☐ Follow existing patterns/style
☐ Add comments for non-obvious code
```

### After Modification

```
☐ Run ALL tests (regression check)
☐ Manual test the affected feature
☐ Check for unintended side effects
☐ Update documentation if needed
☐ Commit with clear message
```

## Rollback Plan

Before any change, know how to undo:

```markdown
## Rollback Plan for [Change]

**Files to modify:**
- /src/user/auth.ts
- /src/user/model.ts

**Backup:**
```bash
cp src/user/auth.ts src/user/auth.ts.backup-$(date +%s)
```

**Rollback command:**
```bash
cp src/user/auth.ts.backup-XXXXX src/user/auth.ts
```

**Test after rollback:**
```bash
npm test
```
```

## Warning Signs (Stop & Re-evaluate)

```
⚠️ "This will be quick" - It's never quick
⚠️ "Just change this one thing" - It always affects more
⚠️ "I know this code" - Read it anyway
⚠️ "Tests are optional" - Always add tests
⚠️ "We'll fix it later" - We won't
```

## The Update Workflow Decision Tree

```
User asks to modify code
        │
        ▼
Is this a new project or modification?
┌───────────────┬───────────────┐
│     NEW       │    UPDATE     │
│   (create)    │  (modify)     │
└───────┬───────┴───────┬───────┘
        │               │
        ▼               ▼
  SPEC WIZARD     UPDATE WORKFLOW
  (docs/SPEC)     (this file)
        │               │
        ▼               ▼
  Build from      1. Discover
     scratch         (read code)
                 2. Plan
                 3. SPEC
                 4. Implement
                 5. Validate
                 6. Document
```

## Self-Improvement Integration

After update, consider logging:

```javascript
// Good corrections to log:
fuse_log_correction(
  what_was_wrong: "assumed the auth code was simple",
  correct_approach: "always read the actual code before modifying"
)

// Or successes to remember:
fuse_log_pattern(
  pattern_name: "incremental-testing",
  description: "run tests after each small change"
)
```
