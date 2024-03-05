import 'package:flutter/material.dart';

// Defines the light color scheme for the application.
const lightColorScheme = ColorScheme(
  brightness: Brightness.light, // Indicates that this is a light color scheme.
  primary: Color(0xFF00687A), // The color displayed most frequently across your app.
  onPrimary: Color(0xFFFFFFFF), // A color that's clearly legible when drawn on 'primary'.
  primaryContainer: Color(0xFFADECFF), // A container color that can be used for components holding primary content.
  onPrimaryContainer: Color(0xFF001F26), // A color that's clearly legible when drawn on 'primaryContainer'.
  secondary: Color(0xFF006A62), // A secondary color for your app.
  onSecondary: Color(0xFFFFFFFF), // A color that's clearly legible when drawn on 'secondary'.
  secondaryContainer: Color(0xFF72F8E9), // A container color that can be used for components holding secondary content.
  onSecondaryContainer: Color(0xFF00201D), // A color that's clearly legible when drawn on 'secondaryContainer'.
  tertiary: Color(0xFF00629D), // An accent color used for less prominent components.
  onTertiary: Color(0xFFFFFFFF), // A color that's clearly legible when drawn on 'tertiary'.
  tertiaryContainer: Color(0xFFCFE5FF), // A container color that can be used for components holding tertiary content.
  onTertiaryContainer: Color(0xFF001D34), // A color that's clearly legible when drawn on 'tertiaryContainer'.
  error: Color(0xFFBA1A1A), // The color to use for input validation errors.
  errorContainer: Color(0xFFFFDAD6), // A container color that can be used for components displaying error messages.
  onError: Color(0xFFFFFFFF), // A color that's clearly legible when drawn on 'error'.
  onErrorContainer: Color(0xFF410002), // A color that's clearly legible when drawn on 'errorContainer'.
  background: Color(0xFFFFFBFF), // The background color for widgets.
  onBackground: Color(0xFF030865), // A color that's clearly legible when drawn on 'background'.
  surface: Color(0xFFFFFBFF), // The background color for cards, sheets, and menus.
  onSurface: Color(0xFF030865), // A color that's clearly legible when drawn on 'surface'.
  surfaceVariant: Color(0xFFDBE4E7), // A variant of the 'surface' color used for differentiation.
  onSurfaceVariant: Color(0xFF3F484B), // A color that's clearly legible when drawn on 'surfaceVariant'.
  outline: Color(0xFF70797C), // The color to use for outlines.
  onInverseSurface: Color(0xFFF1EFFF), // A color that's clearly legible when drawn on the inverse of 'surface'.
  inverseSurface: Color(0xFF1E2578), // The inverse of the 'surface' color.
  inversePrimary: Color(0xFF56D6F5), // The inverse of the 'primary' color.
  shadow: Color(0xFF000000), // The color to use for shadows.
  surfaceTint: Color(0xFF00687A), // A tint color that's applied to the 'surface' color.
  outlineVariant: Color(0xFFBFC8CB), // A variant of the 'outline' color used for differentiation.
  scrim: Color(0xFF000000), // The color to use for scrims.
);

// Defines the dark color scheme for the application.
const darkColorScheme = ColorScheme(
  brightness: Brightness.dark, // Indicates that this is a dark color scheme.
  primary: Color(0xFF56D6F5), // The color displayed most frequently across your app.
  onPrimary: Color(0xFF003641), // A color that's clearly legible when drawn on 'primary'.
  primaryContainer: Color(0xFF004E5D), // A container color that can be used for components holding primary content.
  onPrimaryContainer: Color(0xFFADECFF), // A color that's clearly legible when drawn on 'primaryContainer'.
  secondary: Color(0xFF51DBCD), // A secondary color for your app.
  onSecondary: Color(0xFF003733), // A color that's clearly legible when drawn on 'secondary'.
  secondaryContainer: Color(0xFF00504A), // A container color that can be used for components holding secondary content.
  onSecondaryContainer: Color(0xFF72F8E9), // A color that's clearly legible when drawn on 'secondaryContainer'.
  tertiary: Color(0xFF99CBFF), // An accent color used for less prominent components.
  onTertiary: Color(0xFF003355), // A color that's clearly legible when drawn on 'tertiary'.
  tertiaryContainer: Color(0xFF004A78), // A container color that can be used for components holding tertiary content.
  onTertiaryContainer: Color(0xFFCFE5FF), // A color that's clearly legible when drawn on 'tertiaryContainer'.
  error: Color(0xFFFFB4AB), // The color to use for input validation errors.
  errorContainer: Color(0xFF93000A), // A container color that can be used for components displaying error messages.
  onError: Color(0xFF690005), // A color that's clearly legible when drawn on 'error'.
  onErrorContainer: Color(0xFFFFDAD6), // A color that's clearly legible when drawn on 'errorContainer'.
  background: Color(0xFF212121), // The background color for widgets.
  onBackground: Color(0xFFE0E0FF), // A color that's clearly legible when drawn on 'background'.
  surface: Color(0xFF212121), // The background color for cards, sheets, and menus.
  onSurface: Color(0xFFE0E0FF), // A color that's clearly legible when drawn on 'surface'.
  surfaceVariant: Color(0xFF3F484B), // A variant of the 'surface' color used for differentiation.
  onSurfaceVariant: Color(0xFFBFC8CB), // A color that's clearly legible when drawn on 'surfaceVariant'.
  outline: Color(0xFF899295), // The color to use for outlines.
  onInverseSurface: Color(0xFF030865), // A color that's clearly legible when drawn on the inverse of 'surface'.
  inverseSurface: Color(0xFFE0E0FF), // The inverse of the 'surface' color.
  inversePrimary: Color(0xFF00687A), // The inverse of the 'primary' color.
  shadow: Color(0xFF000000), // The color to use for shadows.
  surfaceTint: Color(0xFF56D6F5), // A tint color that's applied to the 'surface' color.
  outlineVariant: Color(0xFF3F484B), // A variant of the 'outline' color used for differentiation.
  scrim: Color(0xFF000000), // The color to use for scrims.
);
