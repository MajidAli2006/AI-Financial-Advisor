# Setup Guide

## Quick Start

1. **Install Flutter** (if not already installed)
   ```bash
   # Check Flutter installation
   flutter doctor
   ```

2. **Get Dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
   
   This generates:
   - `*.g.dart` files for Riverpod providers
   - Resolves all "Target of URI hasn't been generated" errors

4. **Run the App**
   ```bash
   flutter run
   ```

## Troubleshooting

### "Target of URI hasn't been generated" Errors
These are expected before running `build_runner`. Run:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### "Undefined class" Errors
These will be resolved after code generation. The generated files provide:
- `RouterRef`, `AIServiceRef`, `TransactionRepositoryRef`
- Provider classes like `_$ChatNotifier`, `_$TransactionRepository`

### Watch Mode (Development)
For automatic code generation during development:
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Project Structure Overview

```
lib/
├── core/              # Core infrastructure
│   ├── constants/    # App constants
│   ├── router/       # Navigation
│   ├── services/     # Business logic
│   └── theme/        # Theming
│
├── features/         # Feature modules
│   ├── auth/
│   ├── dashboard/
│   ├── chat/
│   └── transactions/
│
└── shared/           # Shared resources
    ├── models/
    └── widgets/
```

## Design Patterns Used

1. **Repository Pattern**: Data access abstraction
2. **Service Pattern**: Business logic encapsulation
3. **Provider Pattern**: State management (Riverpod)
4. **Dependency Injection**: Loose coupling
5. **Layered Architecture**: Clear separation of concerns

See [ARCHITECTURE.md](./ARCHITECTURE.md) for details.

## Next Steps

1. Run `build_runner` to generate code
2. Run the app
3. Test all features:
   - Dashboard with balance toggle
   - Chart interactions
   - Chat with Roast Bot
   - Transaction details
   - Bank connection flow
4. Capture screenshots for README

## Screenshots

After running the app, capture screenshots of:
- Dashboard screen
- Chat interface
- Transactions list
- Bank connection modal

Add them to `screenshots/` folder and update README.md.

