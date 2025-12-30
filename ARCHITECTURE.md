# FinTalk Architecture Documentation

## Overview

FinTalk follows a **Feature-First Architecture** with clear separation of concerns, implementing multiple design patterns to ensure maintainability, testability, and scalability.

## Design Patterns

### 1. **Repository Pattern**
- **Purpose**: Abstracts data access logic from business logic
- **Implementation**: 
  - `TransactionRepository` - Coordinates between data sources and services
  - `TransactionDataSource` - Handles actual data fetching (API/Database)
- **Benefits**: Easy to swap data sources, testable, single source of truth

### 2. **Service Pattern**
- **Purpose**: Encapsulates business logic separate from UI and data layers
- **Implementation**:
  - `AIService` - Handles AI-related operations (response generation, transaction cleaning)
  - `BankService` - Manages bank connections and data fetching
- **Benefits**: Reusable business logic, easier to mock for testing

### 3. **Provider Pattern (Riverpod)**
- **Purpose**: State management with dependency injection
- **Implementation**: 
  - Feature-specific providers in each feature folder
  - Global providers in `core/` for shared services
- **Benefits**: Type-safe, testable, automatic dependency injection

### 4. **Dependency Injection**
- **Purpose**: Loose coupling between components
- **Implementation**: Riverpod providers inject dependencies
- **Benefits**: Testable, maintainable, follows SOLID principles

### 5. **Layered Architecture**
```
┌─────────────────────────────────┐
│      Presentation Layer          │
│   (Pages, Widgets, Providers)   │
└──────────────┬──────────────────┘
               │
┌──────────────▼──────────────────┐
│      Business Logic Layer         │
│      (Services, Repositories)     │
└──────────────┬──────────────────┘
               │
┌──────────────▼──────────────────┐
│      Data Access Layer           │
│      (Data Sources, Models)      │
└─────────────────────────────────┘
```

## Folder Structure

```
lib/
├── core/                           # Core application infrastructure
│   ├── constants/                 # App-wide constants
│   │   └── app_constants.dart
│   ├── router/                    # Navigation configuration
│   │   └── router.dart
│   ├── services/                  # Business logic services
│   │   ├── ai_service.dart       # AI operations
│   │   └── bank_service.dart     # Bank operations
│   └── theme/                     # Theming
│       └── app_theme.dart
│
├── features/                      # Feature modules (Feature-First)
│   ├── auth/
│   │   └── pages/
│   │       └── login_page.dart
│   │
│   ├── dashboard/
│   │   ├── pages/                 # UI pages
│   │   │   └── dashboard_page.dart
│   │   ├── providers/             # State management
│   │   │   └── dashboard_providers.dart
│   │   └── widgets/               # Feature-specific widgets
│   │       └── bank_connection_modal.dart
│   │
│   ├── chat/
│   │   ├── pages/
│   │   │   └── chat_page.dart
│   │   └── providers/
│   │       └── chat_provider.dart
│   │
│   └── transactions/
│       ├── data_sources/          # Data access layer
│       │   └── transaction_data_source.dart
│       ├── pages/
│       │   └── transactions_page.dart
│       └── repositories/          # Repository pattern
│           └── transaction_repository.dart
│
├── shared/                        # Shared across features
│   ├── models/                    # Data models
│   │   └── transaction.dart
│   └── widgets/                  # Reusable widgets
│       ├── animated_balance.dart
│       └── transaction_tile.dart
│
└── main.dart                      # App entry point
```

## Separation of Concerns

### Presentation Layer
- **Responsibility**: UI rendering, user interactions, state presentation
- **Components**: Pages, Widgets, Providers (Riverpod)
- **Rules**: 
  - No business logic
  - Only UI-related code
  - Consumes providers/services

### Business Logic Layer
- **Responsibility**: Application logic, data transformation, orchestration
- **Components**: Services, Repositories
- **Rules**:
  - No UI dependencies
  - No direct data access
  - Pure business logic

### Data Access Layer
- **Responsibility**: Data fetching, storage, API communication
- **Components**: Data Sources, Models
- **Rules**:
  - No business logic
  - No UI dependencies
  - Only data operations

## State Management Strategy

### Riverpod Providers
1. **StateProvider**: Simple state (balance, visibility toggles)
2. **Provider**: Computed values, derived state
3. **FutureProvider**: Async data fetching
4. **NotifierProvider**: Complex state with methods

### Provider Organization
- Feature-specific providers in feature folders
- Global services in `core/services/`
- Shared providers in `shared/` if needed

## Error Handling

### Current Implementation
- Try-catch blocks in async operations
- Error states in FutureProvider
- User-friendly error messages via SnackBar

### Future Improvements
- Centralized error handling service
- Error logging
- Retry mechanisms
- Offline handling

## Testing Strategy

### Unit Tests
- Services (AI, Bank)
- Repositories
- Data Sources

### Widget Tests
- Individual widgets
- Page components

### Integration Tests
- Feature flows
- Navigation
- State management

## Code Organization Principles

1. **Single Responsibility**: Each class/function has one reason to change
2. **Open/Closed**: Open for extension, closed for modification
3. **Dependency Inversion**: Depend on abstractions, not concretions
4. **DRY**: Don't Repeat Yourself
5. **KISS**: Keep It Simple, Stupid

## Dependency Flow

```
Page → Provider → Repository → DataSource
         ↓
      Service
```

- Pages depend on Providers
- Providers depend on Repositories/Services
- Repositories depend on DataSources and Services
- Services are independent (pure business logic)

## Future Enhancements

1. **Error Handling Service**: Centralized error management
2. **Caching Layer**: Local storage for offline support
3. **Analytics Service**: User behavior tracking
4. **Authentication Service**: User management
5. **API Client**: HTTP client abstraction
6. **Local Database**: SQLite/Hive for persistence

## Best Practices

1. ✅ Use abstract classes for services (easy to mock)
2. ✅ Keep providers close to features
3. ✅ Extract constants to `app_constants.dart`
4. ✅ Use meaningful names
5. ✅ Document complex logic
6. ✅ Follow Flutter/Dart style guide
7. ✅ Use type-safe providers (Riverpod code generation)

