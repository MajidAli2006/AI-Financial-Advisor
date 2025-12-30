# FinTalk - AI Financial Tracking App 💰

A high-performance AI financial tracking app built with Flutter, featuring modern dark mode UI, financial forecasting charts, and an AI-powered "Roast Bot" chat interface.

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)
![Riverpod](https://img.shields.io/badge/Riverpod-2.5+-FF6B6B)

## ✨ Features

- **📊 Dashboard**: Financial forecasting with interactive charts
- **🤖 Roast Bot Chat**: AI-powered chat interface
- **🧹 Smart Transaction Categorization**: AI-cleaned transaction names
- **🏦 Mock Bank Integration**: Simulated bank connection flow
- **🎨 Modern Animations**: Smooth transitions and interactions

## 🚀 Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/MajidAli2006/AI-Financial-Advisor.git
   cd AI-Financial-Advisor
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Riverpod code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 🏗️ Architecture

- **State Management**: Riverpod (Code Generation)
- **Navigation**: GoRouter
- **Design System**: Material Design 3 with dark mode
- **Architecture**: Feature-first folder structure

## 📦 Key Dependencies

- `flutter_riverpod` - State management
- `go_router` - Navigation
- `fl_chart` - Financial charts
- `flutter_animate` - Animations
- `flutter_chat_ui` - Chat interface

## 📁 Project Structure

```
lib/
├── core/           # Core infrastructure
├── features/       # Feature modules
└── shared/         # Shared resources
```

## 📝 Notes

- All backend API calls are mocked with realistic dummy data
- Bank connection flow simulates Plaid integration
- AI responses are hardcoded for demo purposes

## 📄 License

This project is licensed under the MIT License.

---

Built with ❤️ using Flutter
