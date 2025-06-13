# Branch Protection Rules

This repository implements strict branch protection rules to ensure code quality and maintain a clean git history.

## Protected Branches

The following branches are protected:
- `main`
- `master`
- `develop`
- `release/*`
- `feature/*`
- `bugfix/*`

## Protection Rules

### 1. Required Status Checks
- All status checks must pass before merging
- Status checks must be up to date with the latest changes
- Branch must be up to date before merging

### 2. Linear History
- Maintains a clean, linear git history
- Prevents merge commits
- Ensures each commit builds on the previous one

### 3. Force Push Protection
- Prevents force pushing to protected branches
- Maintains branch history integrity
- Prevents accidental history rewrites

### 4. Deletion Protection
- Prevents deletion of protected branches
- Ensures branch permanence
- Maintains code history

## Workflow

1. Create a new branch from the protected branch
2. Make your changes
3. Run tests and ensure all checks pass
4. Create a pull request
5. Get required reviews
6. Merge only when all checks pass

## Enforcement

These rules are enforced through:
- GitHub branch protection settings
- GitHub Actions workflow (`.github/workflows/branch-protection.yml`)
- Repository settings

## Exceptions

Exceptions to these rules can only be made by repository administrators and must be documented in the pull request. 