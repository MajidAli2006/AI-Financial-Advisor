# Screenshots Guide

This directory contains UI screenshots for the FinTalk app.

## Quick Method (Recommended)

The easiest way to generate screenshots is to run the app and take screenshots manually:

1. **Run the app:**
   ```bash
   flutter run
   ```

2. **Navigate through each screen** and take screenshots:
   - **Dashboard**: Default screen when app opens
   - **Chat**: Tap the Chat tab in bottom navigation
   - **Transactions**: Tap the Transactions tab in bottom navigation
   - **Transaction Details**: Tap any transaction in the list
   - **Bank Connection**: Tap the floating action button (🔌) on Dashboard

3. **Save screenshots** with these exact names:
   - `dashboard.png`
   - `chat.png`
   - `transactions.png`
   - `transaction_details.png`
   - `bank_connection.png`

## Automated Method (Integration Tests)

To generate screenshots automatically using integration tests:

1. **Start a device/emulator:**
   ```bash
   # iOS Simulator
   open -a Simulator
   
   # Android Emulator
   flutter emulators --launch <emulator_id>
   ```

2. **Run the screenshot script:**
   ```bash
   ./scripts/generate_screenshots.sh
   ```

   Or manually:
   ```bash
   flutter test integration_test/screenshot_test.dart
   ```

3. **Screenshots will be saved** to the `screenshots/` directory.

## Screenshot Requirements

- **Format**: PNG
- **Resolution**: At least 1080x1920 (or device resolution)
- **Orientation**: Portrait
- **Content**: Full screen capture including:
  - App bar
  - Main content
  - Bottom navigation (if visible)

## Tips

- Wait for animations to complete before taking screenshots
- Ensure the app is in dark mode for consistency
- Make sure all data is loaded (transactions, balance, etc.)
- For transaction details, open a transaction that has been "cleaned" by AI (has sparkle icon)

