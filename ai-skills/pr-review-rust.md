# PR Review: Rust Code

## Purpose
Review Rust pull requests from GitHub, ensuring code quality, safety, and adherence to Rust best practices.

## Initial Checks

Before beginning the review, verify the following:

### 1. No `expect()` or `unwrap()` in Production Code
- Search for `.expect(` and `.unwrap(` calls
- These are **only** acceptable in:
  - Test code (`#[cfg(test)]` modules, `#[test]` functions)
  - `main()` functions where panic-on-failure is acceptable
  - Explicitly documented unreachable cases
- Flag any usage in library code or production paths
- Suggest proper error handling with `Result`, `Option`, or `?` operator

### 2. Code is `rustfmt` Formatted
- Verify code follows standard Rust formatting
- Check for consistent indentation, spacing, and line breaks
- Suggest running `cargo fmt` if formatting issues are found

### 3. Clippy Checks Pass
- Ensure code is free of common Clippy warnings
- Pay attention to:
  - `clippy::unwrap_used`
  - `clippy::expect_used`
  - `clippy::needless_borrow`
  - `clippy::redundant_closure`
  - `clippy::useless_conversion`
- Suggest running `cargo clippy --all-targets --all-features -- -D warnings`

### 4. Iterators Over For Loops
- Prefer iterator chains (`.iter()`, `.map()`, `.filter()`, `.collect()`) over index-based loops
- Acceptable for loops: when iterating over collections directly (`for item in collection`)
- Flag: index-based loops (`for i in 0..len`), manual indexing (`vec[i]`)

### 5. Match Statements Over If/Else Chains
- Replace long if/else chains with `match` expressions
- Use `match` for enum variant handling
- Consider `if let` for single-pattern cases
- Flag: nested if/else, repeated condition checks on same variable

## Review Process

### Step 1: Fetch the PR
1. Get the PR diff from GitHub
2. Identify all modified Rust files (`.rs`)
3. Note test files vs. production code

### Step 2: Analyze Each File
For each modified file:

```
[ ] Check for expect/unwrap usage
[ ] Verify formatting consistency
[ ] Look for Clippy-violation patterns
[ ] Review loop constructs
[ ] Review conditional logic patterns
```

### Step 3: Provide Feedback
Structure feedback as:

```
## 🔴 Blocking Issues
- [Specific violations that must be fixed]

## 🟡 Suggestions
- [Improvements that would enhance code quality]

## 🟢 Positive Notes
- [Good patterns, idiomatic Rust usage]
```

## Common Patterns to Flag

| Pattern | Issue | Suggestion |
|---------|-------|------------|
| `.unwrap()` | Panic on None/Err | Use `?`, `match`, or `unwrap_or` |
| `.expect("msg")` | Panic with message | Use proper error propagation |
| `for i in 0..v.len()` | Index-based loop | Use `for item in v.iter()` |
| `if x == A {} else if x == B {}` | Chain of ifs | Use `match x { A => ..., B => ... }` |
| Manual formatting | Inconsistent style | Run `cargo fmt` |

## Output Format

When reviewing, produce:

1. **Summary**: Brief overview of PR changes
2. **Checklist**: Status of each initial check (✅/❌)
3. **Detailed Findings**: Line-by-line feedback with suggestions
4. **Code Examples**: Show corrected versions where applicable

## Example Review Template

```markdown
## PR Review: [PR Title]

### Initial Checks
- [ ] No expect/unwrap in production code
- [ ] Code is rustfmt formatted
- [ ] Clippy checks pass
- [ ] Iterators used over for loops
- [ ] Match statements used over if/else

### Summary
[Brief description of changes]

### Findings

#### 🔴 Blocking
- **File:line**: Issue description
  ```rust
  // Current
  let value = option.unwrap();

  // Suggested
  let value = option.ok_or(Error::MissingValue)?;
  ```

#### 🟡 Suggestions
- [Improvement suggestions]

#### 🟢 Positive
- [Good patterns observed]
```
