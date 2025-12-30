# Folder Structure Documentation

## Complete Directory Tree

```
AI-Financial-Advisor/
│
├── lib/
│   ├── core/                                    # Core Application Infrastructure
│   │   ├── constants/
│   │   │   └── app_constants.dart              # App-wide constants
│   │   │
│   │   ├── router/
│   │   │   └── router.dart                     # GoRouter configuration
│   │   │
│   │   ├── services/                           # Business Logic Services
│   │   │   ├── ai_service.dart                 # AI operations (abstract + mock)
│   │   │   └── bank_service.dart               # Bank operations (abstract + mock)
│   │   │
│   │   └── theme/
│   │       └── app_theme.dart                  # Theme configuration
│   │
│   ├── features/                                # Feature Modules (Feature-First)
│   │   │
│   │   ├── auth/                               # Authentication Feature
│   │   │   └── pages/
│   │   │       └── login_page.dart             # Login page (placeholder)
│   │   │
│   │   ├── dashboard/                          # Dashboard Feature
│   │   │   ├── pages/
│   │   │   │   └── dashboard_page.dart        # Main dashboard UI
│   │   │   ├── providers/
│   │   │   │   └── dashboard_providers.dart   # Dashboard state management
│   │   │   └── widgets/
│   │   │       └── bank_connection_modal.dart # Bank connection UI
│   │   │
│   │   ├── chat/                               # Chat Feature
│   │   │   ├── pages/
│   │   │   │   └── chat_page.dart             # Chat UI
│   │   │   └── providers/
│   │   │       └── chat_provider.dart         # Chat state management
│   │   │
│   │   └── transactions/                        # Transactions Feature
│   │       ├── data_sources/                   # Data Access Layer
│   │       │   └── transaction_data_source.dart # Transaction data source
│   │       ├── pages/
│   │       │   └── transactions_page.dart      # Transactions list UI
│   │       └── repositories/                   # Repository Layer
│   │           └── transaction_repository.dart # Transaction repository
│   │
│   ├── shared/                                  # Shared Across Features
│   │   ├── models/
│   │   │   └── transaction.dart               # Transaction data model
│   │   └── widgets/
│   │       ├── animated_balance.dart          # Animated balance widget
│   │       └── transaction_tile.dart          # Transaction list item widget
│   │
│   └── main.dart                                # App entry point
│
├── ARCHITECTURE.md                              # Architecture documentation
├── README.md                                    # Project README
├── SETUP.md                                     # Setup instructions
├── FOLDER_STRUCTURE.md                          # This file
├── pubspec.yaml                                 # Dependencies
└── .gitignore                                   # Git ignore rules
```

## Layer Responsibilities

### Core Layer (`lib/core/`)
**Purpose**: Application-wide infrastructure
- **constants/**: Shared constants and configuration
- **router/**: Navigation setup
- **services/**: Business logic services (AI, Bank)
- **theme/**: UI theming

### Features Layer (`lib/features/`)
**Purpose**: Feature-specific code (Feature-First Architecture)
Each feature contains:
- **pages/**: UI screens
- **providers/**: State management
- **widgets/**: Feature-specific widgets
- **repositories/**: Data access (if needed)
- **data_sources/**: Data fetching (if needed)

### Shared Layer (`lib/shared/`)
**Purpose**: Reusable across features
- **models/**: Data models
- **widgets/**: Reusable UI components

## Design Pattern Mapping

| Pattern | Location | Purpose |
|--------|----------|---------|
| Repository | `features/*/repositories/` | Data access abstraction |
| Service | `core/services/` | Business logic |
| Data Source | `features/*/data_sources/` | Data fetching |
| Provider | `features/*/providers/` | State management |
| Model | `shared/models/` | Data structures |

## File Naming Conventions

- **Pages**: `*_page.dart`
- **Widgets**: `*_widget.dart` or `*_tile.dart`
- **Providers**: `*_provider.dart` or `*_providers.dart`
- **Repositories**: `*_repository.dart`
- **Services**: `*_service.dart`
- **Data Sources**: `*_data_source.dart`
- **Models**: `*.dart` (singular, lowercase)

## Adding New Features

1. Create feature folder: `lib/features/new_feature/`
2. Add subfolders as needed:
   - `pages/` for UI
   - `providers/` for state
   - `widgets/` for components
   - `repositories/` for data access
   - `data_sources/` for API calls
3. Update router in `core/router/router.dart`
4. Add feature to navigation if needed

## Best Practices

✅ **Do:**
- Keep features self-contained
- Use shared folder for truly reusable code
- Follow naming conventions
- Separate concerns (UI, state, data)

❌ **Don't:**
- Import between features directly
- Put business logic in UI
- Mix data access with business logic
- Create circular dependencies

