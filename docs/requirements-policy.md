# Requirements Writing Policy

This document defines how to write SMART requirements for use with this framework.

---

## SMART Criteria

Every requirement should be:

- **S**pecific - Clearly defined, no ambiguity
- **M**easurable - Quantifiable acceptance criteria
- **A**chievable - Realistic within constraints
- **R**elevant - Traces to project objectives
- **T**estable - Verifiable through inspection or testing

---

## Requirement Structure (YAML)

```yaml
- id: PRD-XXXX-NNN
  title: "Brief descriptive title"
  source: "Where this came from (doc section, customer email, etc)"
  priority: "P0-Critical | P1-High | P2-Medium | P3-Low"
  type: "Functional | Performance | Standard | Assumption"
  acceptance_criteria:
    - "Specific measurable criterion 1"
    - "Specific measurable criterion 2"
  verification: "How will you verify this? (test, inspection, analysis)"
  clear_or_vague: "Clear | Vague"
  notes: "Additional context"
```

---

## Naming Conventions

**Format:** `[Category]-[Subcategory]-[Number]`

**Categories:**
- `PRD` - Product Requirement
- `NFR` - Non-Functional Requirement
- `SYS` - System Requirement

**Subcategories (examples):**
- `FUNC` - Functional
- `PERF` - Performance
- `SIZE` - Size/Form Factor
- `COST` - Cost/Budget
- `SCHED` - Schedule/Timeline
- `IFACE` - Interface
- `POWER` - Power/Energy
- `STD` - Standards/Regulatory
- `MECH` - Mechanical
- `ELEC` - Electrical

**Examples:**
- `PRD-FUNC-001` - Product functional requirement #1
- `PRD-PERF-002` - Product performance requirement #2
- `NFR-STD-001` - Non-functional standard requirement #1

**Assumptions (derived requirements):**
Add `-ASMP` suffix: `PRD-COST-001-ASMP`

---

## Ground Truth vs Assumptions

### Ground Truth Requirements
- Verbatim from specification document
- No interpretation needed
- Mark as `clear_or_vague: "Clear"`

### Assumption Requirements
- Derived from vague specifications
- Includes derivation process
- Mark as `type: "Assumption"`
- Add risk level and validation flag
- Use `-ASMP` suffix in ID

---

## Example: Good vs Bad Requirements

### ❌ Bad (Vague, Not SMART)
```yaml
- id: PRD-SIZE-001
  title: "Device shall be portable"
  acceptance_criteria:
    - "Easy to carry"
```

### ✅ Good (SMART, Measurable)
```yaml
- id: PRD-SIZE-001
  title: "Portable Device - Size and Weight Constraints"
  source: "Requirements Doc Section 2.3"
  priority: "P1-High"
  acceptance_criteria:
    - "Weight ≤ 1.3 lbs (590 grams)"
    - "Dimensions ≤ 12" × 4" × 2" (L × W × H)"
    - "Fits in standard laptop bag (≤14" diagonal)"
  verification: "Physical measurement + user testing"
```

---

## Traceability

Every requirement should trace to:
1. **Source** - Where it came from
2. **Verification** - How you'll test it
3. **Architecture** - Which solutions satisfy it

Use slash commands to generate traceability:
```bash
/req-trace     # Generate requirements → architecture matrix
```

---

## References

- [IEEE 29148-2018](https://ieeexplore.ieee.org/document/8559686) - Systems and software engineering requirements
- [INCOSE Guide to Writing Requirements](https://www.incose.org/)
