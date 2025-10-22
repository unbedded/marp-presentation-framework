---
marp: true
theme: default
paginate: true
size: 16:9
style: |
  section {
    font-size: 24px;
    padding: 50px;
  }
  h1 {
    font-size: 40px;
    color: #2c3e50;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 3px solid #3498db;
  }
  h2 {
    font-size: 32px;
    color: #34495e;
    margin-top: 10px;
    margin-bottom: 15px;
  }
  table {
    font-size: 20px;
    margin: 20px auto;
    border-collapse: collapse;
  }
  table thead th {
    background-color: #2980b9 !important;
    color: #ffffff !important;
    font-weight: bold;
    padding: 10px 12px;
    border: 2px solid #2c3e50;
  }
  table tbody tr:nth-child(even) {
    background-color: #ecf0f1;
  }
  table tbody tr:nth-child(odd) {
    background-color: #ffffff;
  }
  table td, table th {
    padding: 8px 12px;
    border: 1px solid #95a5a6;
  }
  table tbody td {
    color: #2c3e50;
  }
  code {
    font-size: 18px;
  }
  img {
    max-width: 90%;
    max-height: 500px;
    display: block;
    margin: 20px auto;
  }
  /* Normal text wrapping */
  p, li, td, th {
    white-space: normal;
  }
  strong {
    white-space: nowrap;
  }
  /* Takeaway message box (use > blockquote at bottom of slide) */
  blockquote {
    background-color: #eaf4fb;
    border-left: 5px solid #2980b9;
    padding: 12px 20px;
    margin: 30px 20px 10px 20px;
    font-size: 20px;
    font-weight: bold;
    color: #2c3e50;
    border-radius: 5px;
  }
  blockquote strong {
    color: #3498db;
  }
---

# [Your Presentation Title]

**[Your Subtitle or Context]**

[Your Name]
[Organization / Event]
[Date]

<!-- Speaker notes: 30 seconds introduction. State name, purpose, and agenda overview. -->

---

# Agenda

**Three-Part Structure:**

1. **Problem Statement**
   - Background and context
   - Key challenges

2. **Solution Approach**
   - Alternative solutions
   - Trade-off analysis

3. **Recommendations**
   - Decision framework
   - Next steps

<!-- Speaker notes: Explicitly map to your rubric or evaluation criteria. -->

---

# Problem Statement

**Objective:** [What are you trying to accomplish?]

**Key Constraints:**
- [Constraint 1]
- [Constraint 2]
- [Constraint 3]

**Success Criteria:**
- [How will you measure success?]

> **TAKEAWAY:** [One-sentence summary of the problem]

<!-- Speaker notes: Set up the problem clearly. Explain why this matters. -->

---

# Background

**Current State:**
- [What exists today?]
- [What are the limitations?]

**Requirements:**
| ID | Requirement | Source |
|----|-------------|--------|
| REQ-001 | [First requirement] | [Source document] |
| REQ-002 | [Second requirement] | [Source document] |

> **TAKEAWAY:** [Key insight about requirements]

<!-- Speaker notes: Connect background to requirements. Show you did research. -->

---

# Solution Overview

**Approach:** [High-level description of your solution]

**Key Features:**
- ✅ Feature 1: [Description]
- ✅ Feature 2: [Description]
- ✅ Feature 3: [Description]

**Architecture:**
```
[Simple ASCII diagram or bullet points describing architecture]
```

> **TAKEAWAY:** [Why this solution makes sense]

<!-- Speaker notes: Explain architecture decisions. Connect to requirements. -->

---

# Alternative Solutions

| Attribute | **Option A** | **Option B** | **Option C** |
|-----------|--------------|--------------|--------------|
| **Cost** | Low ($X) | Medium ($Y) | High ($Z) |
| **Timeline** | Fast (X weeks) | Medium (Y weeks) | Slow (Z weeks) |
| **Complexity** | Simple | Moderate | Complex |
| **Risk** | Low | Medium | High |

> **TAKEAWAY:** [No single "best" solution - depends on priorities]

<!-- Speaker notes: Walk through trade-offs. Explain why you considered each option. -->

---

# Trade-Off Analysis

**Option A - [Name]:**
- ✅ Advantages: [List pros]
- ❌ Disadvantages: [List cons]

**Option B - [Name]:**
- ✅ Advantages: [List pros]
- ❌ Disadvantages: [List cons]

**Option C - [Name]:**
- ✅ Advantages: [List pros]
- ❌ Disadvantages: [List cons]

> **TAKEAWAY:** [Which option wins depends on YOUR priorities]

<!-- Speaker notes: Be honest about trade-offs. Show engineering judgment. -->

---

# Decision Framework

**Selection Criteria:**

| Priority | Weight | Option A | Option B | Option C |
|----------|--------|----------|----------|----------|
| Cost | 40% | 🟢 High | 🟡 Medium | 🔴 Low |
| Timeline | 30% | 🟢 High | 🟡 Medium | 🔴 Low |
| Risk | 20% | 🟢 Low | 🟡 Medium | 🔴 High |
| UX | 10% | 🔴 Low | 🟡 Medium | 🟢 High |

> **TAKEAWAY:** [Recommendation based on weighted criteria]

<!-- Speaker notes: Show how you weight trade-offs. Give customer choice. -->

---

# Recommendation

**If cost is critical:** Choose **Option A**
- Trade-off: [What you sacrifice]
- Timeline: [How long it takes]

**If timeline is critical:** Choose **Option B**
- Trade-off: [What you sacrifice]
- Cost: [How much it costs]

**If UX is critical:** Choose **Option C**
- Trade-off: [What you sacrifice]
- Risk: [What could go wrong]

> **TAKEAWAY:** [Give me your priorities, I'll tell you which option wins]

<!-- Speaker notes: Don't pick for them - show decision framework. -->

---

# Timeline

**Week 0-2:** [Phase 1 activities]
**Week 3-4:** [Phase 2 activities]
**Week 5-6:** [Phase 3 activities]
**Week 7-8:** [Phase 4 activities]

**Critical Path:** [What gates everything else?]

**Risks:**
- [Risk 1] → Mitigation: [Strategy]
- [Risk 2] → Mitigation: [Strategy]

> **TAKEAWAY:** [Realistic timeline with risk mitigation]

<!-- Speaker notes: Be honest about timeline. Don't overpromise. -->

---

# Next Steps

**Immediate Actions (Week 0):**
- [ ] [Action item 1]
- [ ] [Action item 2]

**Short Term (Month 1):**
- [ ] [Milestone 1]
- [ ] [Milestone 2]

**Long Term (Month 2+):**
- [ ] [Milestone 3]
- [ ] [Milestone 4]

> **TAKEAWAY:** [Clear path forward with concrete milestones]

<!-- Speaker notes: Give actionable next steps. Show ownership. -->

---

# Summary

**What We've Delivered:**
- [Deliverable 1]
- [Deliverable 2]
- [Deliverable 3]

**Key Insights:**
- [Insight 1]
- [Insight 2]
- [Insight 3]

**Decision Framework:**
- [How to choose between options]

> **TAKEAWAY:** [Final key message]

<!-- Speaker notes: Recap main points. Reinforce key message. -->

---

# Questions?

**Contact:**
- Email: [your.email@example.com]
- GitHub: [github.com/username]

**References:**
- [Key document 1]
- [Key document 2]

> **Thank you!**

<!-- Speaker notes: Pause for questions. Be ready for common questions. -->

---

# BACKUP SLIDES

## Additional Technical Details

[Content for appendix / backup slides]

<!-- Only show if asked during Q&A -->
