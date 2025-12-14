---
description: "Analyze and suggest improvements for the project architecture"
---

# Task
You are tasked with analyzing an existing codebase and suggesting architectural improvements. Create a comprehensive, well-structured document with actionable recommendations.

## Analysis Phase
1. **Explore the codebase structure** using LS, Glob, and Read tools
2. **Identify current architectural patterns** and design decisions
3. **Analyze code quality indicators**:
   - Separation of concerns
   - Dependency management
   - Testing coverage and strategy
   - Error handling patterns
   - Performance considerations
   - Security practices
4. **Review configuration and infrastructure** setup
5. **Examine documentation quality** and developer experience

## Improvement Analysis
1. **Compare against best practices** for the identified architectural pattern
2. **Identify technical debt** and maintainability issues
3. **Spot missing patterns** or incomplete implementations
4. **Find scalability and performance bottlenecks**
5. **Review testing gaps** and quality assurance issues
6. **Assess security vulnerabilities** and defensive coding practices

## Documentation Creation
1. **Create private .claude_docs folder** if it doesn't exist
2. **Generate architectural_improvements.md** with the following structure:

### Required Sections:

#### 📊 **Current Architecture Analysis**
- System overview and current state
- Architectural patterns identified
- Strengths of current implementation
- Technology stack assessment

#### 🎯 **Improvement Recommendations**
Organize by priority and impact:

##### 🔥 **Critical Issues (High Priority)**
- Security vulnerabilities
- Performance bottlenecks
- Architectural violations
- Technical debt with immediate impact

##### ⚡ **Performance Optimizations (Medium Priority)**
- Caching strategies
- Database query optimization
- Resource utilization improvements
- Scaling considerations

##### 🧹 **Code Quality Improvements (Medium Priority)**
- Refactoring opportunities
- Design pattern implementations
- Code duplication elimination
- Naming and structure consistency

##### 🔧 **Developer Experience Enhancements (Low Priority)**
- Documentation improvements
- Development tooling
- CI/CD pipeline enhancements
- Testing infrastructure

#### 📋 **Implementation Roadmap**
```
Phase 1: Critical Fixes (Week 1-2)
├── 🔥 Security patches
├── 🔥 Performance bottlenecks
└── 🔥 Architecture violations

Phase 2: Quality Improvements (Week 3-4)
├── ⚡ Caching implementation
├── 🧹 Code refactoring
└── 🧹 Pattern implementations


Phase 3: Experience Enhancements (Week 5-6)
├── 🔧 Documentation updates
├── 🔧 Testing improvements
└── 🔧 Tooling enhancements
```

#### 💡 **Specific Code Examples**
For each major recommendation:
- **Current Code**: Show problematic patterns
- **Improved Code**: Demonstrate better implementation
- **Benefits**: Explain advantages of the change
- **Migration Path**: Steps to implement safely

#### 🧪 **Testing Strategy Improvements**
- Current testing gaps
- Recommended test types and coverage
- Testing infrastructure improvements
- Quality gates and automation

#### 📈 **Metrics and Monitoring**
- Suggested performance metrics
- Error tracking improvements
- Business metrics integration
- Monitoring dashboard recommendations

#### 🔒 **Security Enhancements**
- Vulnerability assessments
- Defensive coding practices
- Authentication/authorization improvements
- Data protection recommendations

### Formatting Guidelines:
- Use emojis for visual organization (🔥⚡🧹🔧📊etc.)
- Include code examples with file paths
- Show before/after comparisons
- Use priority indicators (Critical/High/Medium/Low)
- Include implementation effort estimates
- Add impact assessment for each recommendation

## Output Requirements:
- Save to a private folder with the name `architectural_improvements.md`
- Include actionable, specific recommendations
- Provide implementation examples where applicable
- Organize by priority and business impact
- Include effort estimates and timelines
- Reference specific files and line numbers

This command produces a thorough architectural improvement analysis with concrete, actionable recommendations organized by priority and impact.
