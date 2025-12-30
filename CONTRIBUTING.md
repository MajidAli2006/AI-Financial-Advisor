# Contributing Guidelines

## Code Style

### Dart/Flutter Style Guide
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart)
- Use `dart format .` before committing
- Run `flutter analyze` to check for issues

### Naming Conventions
- **Files**: snake_case (`transaction_tile.dart`)
- **Classes**: PascalCase (`TransactionTile`)
- **Variables/Functions**: camelCase (`getTransactions`)
- **Constants**: camelCase with const (`appConstants`)

## Architecture Principles

### 1. Separation of Concerns
- **UI Layer**: Only presentation logic
- **Business Layer**: Pure business logic (Services)
- **Data Layer**: Only data access (Repositories, Data Sources)

### 2. Dependency Rule
```
UI → Providers → Repositories/Services → Data Sources
```

### 3. Feature Isolation
- Features should be self-contained
- Use `shared/` for truly reusable code
- Avoid direct imports between features

## Adding New Features

### Step-by-Step Process

1. **Create Feature Structure**
   ```
   lib/features/new_feature/
   ├── pages/
   ├── providers/
   ├── widgets/
   └── repositories/ (if needed)
   ```

2. **Define Data Models** (if needed)
   - Add to `shared/models/` if reusable
   - Add to feature folder if feature-specific

3. **Create Data Source** (if needed)
   - Implement `*DataSource` interface
   - Handle data fetching logic

4. **Create Repository** (if needed)
   - Inject data source and services
   - Coordinate business logic

5. **Create Service** (if business logic needed)
   - Add to `core/services/`
   - Use abstract class for testability

6. **Create Providers**
   - Use Riverpod code generation
   - Keep state management logic here

7. **Create UI**
   - Pages in `pages/`
   - Widgets in `widgets/`
   - Use providers for state

8. **Update Router**
   - Add routes in `core/router/router.dart`
   - Update navigation if needed

## Testing

### Unit Tests
- Test services and repositories
- Mock dependencies
- Test business logic

### Widget Tests
- Test individual widgets
- Test user interactions
- Verify UI states

### Integration Tests
- Test feature flows
- Test navigation
- Test state management

## Pull Request Process

1. **Create Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make Changes**
   - Follow code style
   - Add tests
   - Update documentation

3. **Run Checks**
   ```bash
   flutter analyze
   flutter test
   dart format .
   ```

4. **Commit Changes**
   ```bash
   git commit -m "feat: add your feature description"
   ```

5. **Push and Create PR**
   - Push to your fork
   - Create pull request
   - Add description of changes

## Commit Message Format

Use conventional commits:
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `style:` Formatting
- `refactor:` Code refactoring
- `test:` Adding tests
- `chore:` Maintenance

Example:
```
feat: add transaction filtering
fix: resolve balance calculation error
docs: update architecture documentation
```

## Code Review Checklist

- [ ] Code follows style guide
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] No linter errors
- [ ] Follows architecture patterns
- [ ] Proper error handling
- [ ] No hardcoded values (use constants)

## Questions?

Open an issue or contact maintainers for guidance.

