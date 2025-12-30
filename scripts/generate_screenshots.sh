#!/bin/bash

echo "📸 Generating UI Screenshots for FinTalk..."
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed. Please install Flutter first."
    exit 1
fi

# Create screenshots directory if it doesn't exist
mkdir -p screenshots

echo "🔧 Installing dependencies..."
flutter pub get

echo ""
echo "📱 Make sure you have a device/emulator running:"
echo "   - iOS Simulator: open -a Simulator"
echo "   - Android Emulator: flutter emulators --launch <emulator_id>"
echo ""
read -p "Press Enter when your device/emulator is ready..."

echo ""
echo "🚀 Running screenshot tests..."
echo ""

# Run integration tests
flutter test integration_test/screenshot_test.dart

echo ""
echo "✅ Screenshots generated!"
echo "📁 Check the screenshots/ directory for generated images."
echo ""

