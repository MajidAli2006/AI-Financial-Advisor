# Fastlane Setup Guide

Fastlane automates building, testing, and deploying your FinTalk app to both iOS App Store and Google Play Store.

## Prerequisites

### iOS
- Apple Developer Account
- Xcode installed
- App Store Connect API Key (recommended) or Apple ID credentials
- Certificates and provisioning profiles set up

### Android
- Google Play Console account
- Service Account JSON file for Play Store API
- Keystore file for signing

## Installation

1. **Install Fastlane**
   ```bash
   # macOS (for iOS)
   sudo gem install fastlane
   
   # Or using Homebrew
   brew install fastlane
   ```

2. **Install Bundler** (recommended)
   ```bash
   gem install bundler
   ```

3. **Setup iOS Fastlane**
   ```bash
   cd ios
   bundle init
   bundle add fastlane
   bundle exec fastlane init
   ```

4. **Setup Android Fastlane**
   ```bash
   cd android
   bundle init
   bundle add fastlane
   bundle exec fastlane init
   ```

## Configuration

### iOS Configuration

1. **Update Appfile** (`ios/fastlane/Appfile`)
   ```ruby
   app_identifier("com.yourcompany.fintalk")
   apple_id("your-apple-id@example.com")
   team_id("YOUR_TEAM_ID")
   ```

2. **Setup Match** (for certificates)
   ```bash
   cd ios
   bundle exec fastlane match init
   ```

### Android Configuration

1. **Create Keystore**
   ```bash
   keytool -genkey -v -keystore android/app/keystore.jks \
     -keyalg RSA -keysize 2048 -validity 10000 \
     -alias upload
   ```

2. **Update `android/key.properties`**
   ```properties
   storePassword=your_keystore_password
   keyPassword=your_key_password
   keyAlias=upload
   storeFile=keystore.jks
   ```

3. **Setup Google Play Service Account**
   - Go to Google Cloud Console
   - Create a service account
   - Download JSON key
   - Grant Play Console access

## Usage

### iOS

**Build and upload to TestFlight:**
```bash
cd ios
bundle exec fastlane beta
```

**Build for App Store:**
```bash
cd ios
bundle exec fastlane release
```

**Run tests:**
```bash
cd ios
bundle exec fastlane test
```

### Android

**Build and upload to Internal Testing:**
```bash
cd android
bundle exec fastlane beta
```

**Build APK:**
```bash
cd android
bundle exec fastlane build_apk
```

**Build for Production:**
```bash
cd android
bundle exec fastlane release
```

### Common Commands

**Run Flutter tests:**
```bash
fastlane flutter_test
```

**Run Flutter analyze:**
```bash
fastlane flutter_analyze
```

**Clean build artifacts:**
```bash
fastlane clean
```

## CI/CD Integration

### GitHub Actions

The project includes a GitHub Actions workflow (`.github/workflows/fastlane.yml`) that:
- Runs tests on push/PR
- Builds and deploys on main branch
- Supports both iOS and Android

**Required Secrets:**
- `APPLE_ID`: Your Apple ID
- `TEAM_ID`: Your Apple Developer Team ID
- `MATCH_PASSWORD`: Match encryption password
- `GOOGLE_PLAY_SERVICE_ACCOUNT_JSON`: Service account JSON content

### Setting up GitHub Secrets

1. Go to your repository → Settings → Secrets and variables → Actions
2. Add the following secrets:
   - `APPLE_ID`
   - `TEAM_ID`
   - `MATCH_PASSWORD`
   - `GOOGLE_PLAY_SERVICE_ACCOUNT_JSON`

## Environment Variables

Copy `fastlane/.env.example` to `fastlane/.env` and fill in your values:

```bash
cp fastlane/.env.example fastlane/.env
```

## Troubleshooting

### iOS Issues

**Certificate errors:**
```bash
cd ios
bundle exec fastlane match development
bundle exec fastlane match appstore
```

**Code signing issues:**
- Ensure Xcode is properly configured
- Check provisioning profiles in Xcode

### Android Issues

**Keystore not found:**
- Ensure keystore file exists at specified path
- Check `key.properties` configuration

**Play Store API errors:**
- Verify service account has correct permissions
- Check JSON key file path

## Best Practices

1. **Use Match for iOS**: Keeps certificates in sync across team
2. **Store secrets securely**: Use environment variables or secret management
3. **Test locally first**: Run fastlane commands locally before CI/CD
4. **Version management**: Let Fastlane handle version increments
5. **Automated testing**: Run tests before building

## Additional Resources

- [Fastlane Documentation](https://docs.fastlane.tools/)
- [iOS Code Signing Guide](https://docs.fastlane.tools/codesigning/getting-started/)
- [Android Deployment Guide](https://docs.fastlane.tools/getting-started/android/setup/)

