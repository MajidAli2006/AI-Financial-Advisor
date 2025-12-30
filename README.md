# FinTalk - AI Financial Tracking App 💰

A high-performance AI financial tracking app built with Flutter, featuring modern dark mode UI, financial forecasting charts, and an AI-powered "Roast Bot" chat interface.

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)
![Riverpod](https://img.shields.io/badge/Riverpod-2.5+-FF6B6B)

## 🚀 Quick Overview

```
┌─────────────────────────────────────────────────────────────┐
│                                                               │
│  💰 FinTalk - AI Financial Tracking App                      │
│                                                               │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐     │
│  │ 📊 Dashboard │  │ 💬 Roast Bot │  │ 📋 Smart     │     │
│  │               │  │              │  │    Categories│     │
│  │ • Balance     │  │ • AI Chat    │  │              │     │
│  │ • Charts      │  │ • Responses  │  │ • AI Cleaned │     │
│  │ • Forecast    │  │ • Dark UI    │  │ • Sparkles   │     │
│  └──────────────┘  └──────────────┘  └──────────────┘     │
│                                                               │
│  🎨 Dark Mode  |  🎯 Modern UI  |  ⚡ Smooth Animations      │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

## 🎨 UI Preview

> **Note**: All screens feature a modern dark mode design with neon green (#00FFA3) accents, smooth animations, and intuitive interactions.

### 📱 App Navigation Flow

```
                    ┌─────────────┐
                    │   App Start │
                    └──────┬──────┘
                           │
                           ▼
              ┌──────────────────────┐
              │    Bottom Navigation │
              └──────────┬───────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
        ▼                ▼                ▼
┌──────────────┐ ┌──────────────┐ ┌──────────────┐
│  Dashboard   │ │     Chat     │ │ Transactions │
│   (Home)     │ │  (Roast Bot) │ │     List     │
└──────┬───────┘ └──────────────┘ └──────┬───────┘
       │                                  │
       │                                  │
       ▼                                  ▼
┌──────────────┐                  ┌──────────────┐
│ Bank Connect │                  │ Transaction  │
│    Modal     │                  │   Details    │
└──────────────┘                  │  Bottom Sheet │
                                 └──────────────┘
```

---

## 🎨 UI Preview

### 📊 Dashboard Screen

```
┌─────────────────────────────────────────────────────────┐
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  Total Balance                          👁️      │   │
│  │  $12,450.00                                        │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  Spending Forecast                                │   │
│  │                                                    │   │
│  │    5000 ┤                                        │   │
│  │    4000 ┤     ╱───╲                              │   │
│  │    3000 ┤   ╱─     ─╲                            │   │
│  │    2000 ┤ ╱─         ─╲                          │   │
│  │    1000 ┤─             ─╲                        │   │
│  │       0 ┼────────────────────────────            │   │
│  │         Mon Tue Wed Thu Fri Sat Sun              │   │
│  │                                                    │   │
│  │  ─── Actual Spending                             │   │
│  │  ─ ─ ─ Predicted Spending                        │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│  Recent Transactions                                     │
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  🎬  Netflix                    -$15.99         │   │
│  │      Yesterday                                  │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  ☕  Starbucks                  -$5.45          │   │
│  │      2 days ago                                  │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  📦  Amazon                     -$89.99         │   │
│  │      3 days ago                                  │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│                                    ┌─────┐              │
│                                    │  🔌 │              │
│                                    └─────┘              │
│                                                           │
│  ┌──────────────┬──────────────┬──────────────┐        │
│  │ 📊 Dashboard │ 💬 Chat      │ 📋 Trans    │        │
│  └──────────────┴──────────────┴──────────────┘        │
└─────────────────────────────────────────────────────────┘
```

**Features:**
- 💰 Animated balance counter (starts from $0)
- 👁️ Eye icon to toggle balance visibility
- 📈 Interactive chart with touch tooltips
- 📋 Recent transactions with icons
- 🔌 Floating action button for bank connection

---

### 💬 Chat Interface (Roast Bot)

```
┌─────────────────────────────────────────────────────────┐
│  Roast Bot                                    ╳          │
├─────────────────────────────────────────────────────────┤
│                                                           │
│                                                           │
│  ┌──────────────────────────────────────────────┐      │
│  │  🤖 Roast Bot                                 │      │
│  │                                                │      │
│  │  I'm analyzing your spending. Don't worry,    │      │
│  │  I won't judge... much.                        │      │
│  │                                                │      │
│  └──────────────────────────────────────────────┘      │
│                                                           │
│                                                           │
│                    ┌──────────────────────────────┐    │
│                    │  You                          │    │
│                    │                                │    │
│                    │  How much did I spend on       │    │
│                    │  coffee this month?           │    │
│                    │                                │    │
│                    └──────────────────────────────┘    │
│                                                           │
│                                                           │
│  ┌──────────────────────────────────────────────┐      │
│  │  🤖 Roast Bot                                 │      │
│  │                                                │      │
│  │  You spent $200 on bean water this month.     │      │
│  │  Stop it.                                      │      │
│  │                                                │      │
│  └──────────────────────────────────────────────┘      │
│                                                           │
│                                                           │
│  ┌────────────────────────────────────────────────┐    │
│  │  Type a message...                    [Send] →  │    │
│  └────────────────────────────────────────────────┘    │
│                                                           │
│  ┌──────────────┬──────────────┬──────────────┐        │
│  │ 📊 Dashboard │ 💬 Chat      │ 📋 Trans    │        │
│  └──────────────┴──────────────┴──────────────┘        │
└─────────────────────────────────────────────────────────┘
```

**Features:**
- 🤖 AI "Roast Bot" persona
- 💬 Dark-themed chat bubbles
- ⚡ Smooth message animations
- ⌨️ Input field with send button
- 🎯 Contextual AI responses

---

### 📋 Transactions List

```
┌─────────────────────────────────────────────────────────┐
│  Transactions                                  ╳         │
├─────────────────────────────────────────────────────────┤
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  🎬  Netflix                    ✨  -$15.99      │   │
│  │      Yesterday                                  │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  ☕  Starbucks                  ✨  -$5.45       │   │
│  │      2 days ago                                  │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  📦  Amazon                     ✨  -$89.99      │   │
│  │      3 days ago                                  │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  🚗  Uber                        -$23.50        │   │
│  │      4 days ago                                  │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  🎵  Spotify                     ✨  -$9.99      │   │
│  │      5 days ago                                  │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  ⚡  Electric Bill               -$120.00       │   │
│  │      6 days ago                                  │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  🛒  Grocery Store               ✨  -$145.67     │   │
│  │      7 days ago                                  │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│  ┌──────────────┬──────────────┬──────────────┐        │
│  │ 📊 Dashboard │ 💬 Chat      │ 📋 Trans    │        │
│  └──────────────┴──────────────┴──────────────┘        │
└─────────────────────────────────────────────────────────┘
```

**Features:**
- ✨ Sparkle icon indicates AI-cleaned transactions
- 🎨 Color-coded transaction icons
- 📅 Date formatting
- 💰 Amount display (green for positive, white for negative)
- 👆 Tap to view transaction details

---

### 📄 Transaction Detail Bottom Sheet

```
┌─────────────────────────────────────────────────────────┐
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  Transaction Details                    ╳        │   │
│  ├─────────────────────────────────────────────────┤   │
│  │                                                  │   │
│  │  Original Bank Text                             │   │
│  │  ACH WDL NFLX DAT 99                            │   │
│  │                                                  │   │
│  │  AI Cleaned Name                                 │   │
│  │  Netflix                                         │   │
│  │                                                  │   │
│  │  Amount                                          │   │
│  │  -$15.99                                         │   │
│  │                                                  │   │
│  │  Category                                        │   │
│  │  ┌──────────────────────────────────────────┐  │   │
│  │  │ Entertainment                    ▼        │  │   │
│  │  └──────────────────────────────────────────┘  │   │
│  │                                                  │   │
│  │  ┌──────────────────────────────────────────┐  │   │
│  │  │         Verify                           │  │   │
│  │  └──────────────────────────────────────────┘  │   │
│  │                                                  │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
└─────────────────────────────────────────────────────────┘
```

**Features:**
- 📝 Shows original bank text vs cleaned name
- 🏷️ Category dropdown with AI suggestions
- ✅ Verify button triggers confetti animation
- 🎉 Success feedback with snackbar

---

### 🏦 Bank Connection Modal

```
┌─────────────────────────────────────────────────────────┐
│  Connect your institution                    ╳           │
├─────────────────────────────────────────────────────────┤
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  🏦  Chase                              →       │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  🏦  Bank of America                     →       │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  🏦  Wells Fargo                         →       │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  🏦  Citibank                            →       │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
│  ┌─────────────────────────────────────────────────┐   │
│  │  🏦  Capital One                         →       │   │
│  └─────────────────────────────────────────────────┘   │
│                                                           │
└─────────────────────────────────────────────────────────┘
```

**Loading State:**
```
┌─────────────────────────────────────────────────────────┐
│  Connect your institution                    ╳           │
├─────────────────────────────────────────────────────────┤
│                                                           │
│                                                           │
│                    ⏳  Connecting to Chase...            │
│                                                           │
│                                                           │
└─────────────────────────────────────────────────────────┘
```

**Success State:**
```
┌─────────────────────────────────────────────────────────┐
│                                                           │
│                    ✅ Successfully connected!             │
│                                                           │
│                    Balance updated to $18,500.00        │
│                                                           │
└─────────────────────────────────────────────────────────┘
```

**Features:**
- 🏦 List of major banks
- ⏳ Loading indicator during connection
- ✅ Success message with updated balance
- 🔄 Automatic navigation back to dashboard

---

### 🎨 Design System Overview

**Color Palette:**
```
┌─────────────────────────────────────────────────────────┐
│                                                           │
│  Primary Green    #00FFA3  ████████████████             │
│  Background Dark  #121212  ████████████████             │
│  Card Dark        #1E1E1E  ████████████████             │
│  Text Primary     #FFFFFF  ████████████████             │
│  Text Secondary   #B0B0B0  ████████████████             │
│                                                           │
└─────────────────────────────────────────────────────────┘
```

**Typography:**
- **Font**: Inter (Google Fonts)
- **Balance**: 36px, Bold
- **Title**: 20px, Semi-Bold
- **Body**: 16px, Regular
- **Caption**: 12px, Regular

**Components:**
- **Cards**: 16px border radius, dark gray background
- **Buttons**: 12px border radius, neon green background
- **Icons**: Phosphor Icons, 24px default size
- **Spacing**: 8px, 16px, 24px grid system

---

### 🎬 User Interactions & Animations

**Dashboard:**
- Balance counter animates from $0 to final amount on load
- Chart fades in with slide-up animation
- Transactions appear with staggered fade-in effect
- Eye icon toggle smoothly transitions balance visibility

**Chat:**
- Messages slide in from bottom
- Typing indicator appears before AI responses
- Smooth scroll to latest message
- Input field expands on focus

**Transactions:**
- List items fade in with horizontal slide
- Sparkle icons pulse gently on AI-cleaned items
- Bottom sheet slides up with backdrop blur
- Confetti animation on verification

**Bank Connection:**
- Modal slides up from bottom
- Loading spinner rotates smoothly
- Success state fades in
- Balance updates with counter animation

**Navigation:**
- Page transitions use fade + slide effect
- Bottom nav bar highlights active tab
- Smooth tab switching animations
- Custom page transitions via GoRouter

---

### 📸 Screenshots

> **📷 Screenshots**: After running the app, capture actual screenshots and add them here for a more realistic preview.

To add screenshots:
1. Run the app: `flutter run`
2. Navigate through all features
3. Capture screenshots and save to `screenshots/` folder
4. Update this section with:
   ```markdown
   ### Dashboard
   ![Dashboard](screenshots/dashboard.png)
   
   ### Chat Interface
   ![Chat](screenshots/chat.png)
   
   ### Transactions List
   ![Transactions](screenshots/transactions.png)
   
   ### Bank Connection
   ![Bank Connection](screenshots/bank_connection.png)
   ```

## ✨ Features

- **📊 Dashboard**: Financial forecasting with interactive charts (fl_chart)
  - Animated balance counter
  - Spending history vs predicted spending visualization
  - Recent transactions preview
  
- **🤖 Roast Bot Chat**: AI-powered chat interface using flutter_chat_ui
  - Contextual AI responses
  - Dark mode optimized UI
  - Smooth message animations
  
- **🧹 Smart Transaction Categorization**: AI-cleaned transaction names
  - Visual indicators for AI-processed transactions
  - Category suggestions
  - Transaction detail bottom sheet
  
- **🏦 Mock Plaid Integration**: Simulated bank connection flow
  - Bank selection modal
  - Connection simulation
  - Balance update after connection
  
- **🎨 Modern Animations**: Premium feel with flutter_animate
  - Page transitions
  - Staggered list animations
  - Confetti celebrations

## 🏗️ Architecture

This project follows **Feature-First Architecture** with clear separation of concerns:

- **State Management**: Riverpod (Code Generation variant)
- **Navigation**: GoRouter with custom transitions
- **Design System**: Dark mode by default with neon green accent (#00FFA3)
- **Design Patterns**: Repository, Service, Provider, Dependency Injection

See [ARCHITECTURE.md](./ARCHITECTURE.md) for detailed architecture documentation.

**Design System:**
- Comprehensive design tokens (spacing, colors, typography)
- Reusable components (`AppCard`, `AppButton`, `AppSpacing`)
- Material Design 3 compliant
- Full light/dark theme support

See [DESIGN_SYSTEM.md](./DESIGN_SYSTEM.md) for complete design system documentation.

## 📁 Project Structure

```
lib/
├── core/                    # Core infrastructure
│   ├── constants/         # App-wide constants
│   ├── router/            # Navigation
│   ├── services/          # Business logic services
│   └── theme/             # Theming
├── features/              # Feature modules
│   ├── auth/
│   ├── dashboard/
│   ├── chat/
│   └── transactions/
└── shared/                # Shared resources
    ├── models/
    └── widgets/
```

## 🚀 Setup Instructions

### Prerequisites
- Flutter SDK 3.0 or higher
- Dart 3.0 or higher

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd AI-Financial-Advisor
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Riverpod Code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the App**
   ```bash
   flutter run
   ```

### For Development

To watch for changes and auto-generate code:
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

## 📦 Key Dependencies

| Package | Purpose |
|---------|---------|
| `flutter_riverpod` | State management |
| `riverpod_annotation` + `riverpod_generator` | Code generation |
| `go_router` | Navigation |
| `fl_chart` | Financial charts |
| `flutter_animate` | Animations |
| `flutter_chat_ui` | Chat interface |
| `phosphor_flutter` | Icons |
| `google_fonts` | Typography (Inter font) |
| `confetti` | Confetti animations |
| `intl` | Currency formatting |

## 🎨 Design System

FinTalk uses a comprehensive design system following Material Design 3 principles. See [DESIGN_SYSTEM.md](./DESIGN_SYSTEM.md) for complete documentation.

### Quick Reference

**Colors:**
- **Primary**: `#00FFA3` (Neon Green)
- **Success**: `#00FFA3` (Green)
- **Error**: `#FF4444` (Red)
- **Warning**: `#FFB800` (Orange)

**Typography:**
- **Font Family**: Inter (via Google Fonts)
- **Scale**: Display (36px), Headline (20-24px), Title (14-18px), Body (12-16px), Label (11-14px)

**Spacing:**
- **Scale**: 4px base unit (XS: 4px, SM: 8px, MD: 16px, LG: 24px, XL: 32px, XXL: 48px)

**Components:**
- `AppCard` - Standardized card component
- `AppButton` - Button with variants (primary, secondary, text) and sizes
- `AppSpacing` - Consistent spacing widgets
- Typography system with semantic styles

**Usage:**
```dart
import 'package:fin_talk/core/design_system/design_system.dart';

// Use design tokens
SizedBox(height: DesignTokens.spacingMD)

// Use components
AppCard(
  child: YourContent(),
  padding: EdgeInsets.all(DesignTokens.spacingLG),
)

// Use typography
Text('Hello', style: AppTypography.bodyLarge(context))

// Use spacing
Vertical.md  // or Horizontal.md
```

## 🧪 Testing

### Running Tests
```bash
# Unit tests
flutter test

# Widget tests
flutter test test/widget_test.dart

# Integration tests
flutter test integration_test/
```

### Test Coverage
- Services (AI, Bank)
- Repositories
- Data Sources
- Widgets

## 🔧 Development Guidelines

### Code Style
- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `flutter analyze` to check code quality
- Run `dart format .` before committing

### Adding New Features
1. Create feature folder in `lib/features/`
2. Add pages, providers, widgets as needed
3. Create data sources if data access is needed
4. Add services for business logic
5. Update router configuration

### Best Practices
- ✅ Use abstract classes for services (easy to mock)
- ✅ Keep providers close to features
- ✅ Extract constants to `app_constants.dart`
- ✅ Use meaningful names
- ✅ Document complex logic
- ✅ Follow separation of concerns

## 📝 Notes

- **Backend**: All backend API calls are mocked with realistic dummy data
- **Bank Integration**: Bank connection flow simulates Plaid integration
- **AI Responses**: AI responses in chat are hardcoded for demo purposes
- **Transaction Cleaning**: Uses simple pattern matching (can be enhanced with ML)

## 🗺️ Roadmap

- [ ] Real API integration
- [ ] Authentication flow
- [ ] Offline support with local database
- [ ] Advanced AI transaction categorization
- [ ] Budget planning features
- [ ] Export functionality
- [ ] Multi-currency support

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 👨‍💻 Author

Built with ❤️ using Flutter

---

**Note**: This is a frontend-only implementation. All backend services (AI, Banking) are abstracted into Repository classes and mocked with realistic dummy data for demonstration purposes.
