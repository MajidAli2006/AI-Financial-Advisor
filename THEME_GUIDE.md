# Theme Guide

FinTalk supports both **Light** and **Dark** themes with automatic system preference detection and manual switching.

## Theme Features

### ✅ Implemented Features

1. **Light & Dark Themes**
   - Complete theme support for both modes
   - System preference detection
   - Manual theme toggle

2. **Theme Persistence**
   - Theme preference saved using `shared_preferences`
   - Persists across app restarts

3. **Theme-Aware Components**
   - All widgets adapt to current theme
   - Smooth transitions between themes
   - Consistent color scheme throughout

## Usage

### Toggle Theme

The theme toggle button is available in the AppBar on the Dashboard:

```dart
// Theme toggle widget
ThemeToggle()
```

### Programmatic Theme Control

```dart
// Get theme provider
final themeNotifier = ref.read(themeModeNotifierProvider.notifier);

// Set theme
await themeNotifier.setTheme(ThemeMode.dark);
await themeNotifier.setTheme(ThemeMode.light);
await themeNotifier.setTheme(ThemeMode.system);

// Toggle theme
await themeNotifier.toggleTheme();
```

## Color Scheme

### Dark Theme
- **Background**: `#121212` (Deep Charcoal)
- **Cards**: `#1E1E1E` (Slightly Lighter Gray)
- **Primary**: `#00FFA3` (Neon Green)
- **Text Primary**: `#FFFFFF`
- **Text Secondary**: `#B0B0B0`

### Light Theme
- **Background**: `#FAFAFA` (Off White)
- **Cards**: `#FFFFFF` (Pure White)
- **Primary**: `#00FFA3` (Neon Green)
- **Text Primary**: `#1A1A1A`
- **Text Secondary**: `#666666`

## Best Practices

### Using Theme Colors

✅ **Do:**
```dart
// Use theme colors
final colorScheme = Theme.of(context).colorScheme;
final textColor = colorScheme.onSurface;
final backgroundColor = colorScheme.surface;
```

❌ **Don't:**
```dart
// Hardcode colors
final textColor = Colors.white;
final backgroundColor = Colors.black;
```

### Theme-Aware Widgets

All widgets should use `Theme.of(context)` to access theme colors:

```dart
Widget build(BuildContext context) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;
  
  return Container(
    color: colorScheme.surface,
    child: Text(
      'Hello',
      style: theme.textTheme.bodyLarge,
    ),
  );
}
```

## Theme Structure

```
lib/core/theme/
├── app_theme.dart          # Theme definitions
└── theme_provider.dart     # Theme state management
```

## Testing Themes

To test both themes:

1. **Manual Toggle**: Use the theme toggle button in the app
2. **System Preference**: Change device theme settings
3. **Programmatic**: Use theme provider methods

## Future Enhancements

- [ ] Custom theme colors
- [ ] Theme preview
- [ ] Multiple color schemes
- [ ] Theme animations
- [ ] Accessibility improvements

