import 'package:flutter/material.dart';

/// Application color palette
/// This file contains all colors used throughout the app
/// for consistent theming and easy maintenance
class AppColors {
  // ============================================================================
  // PRIMARY COLORS
  // ============================================================================

  /// Primary brand color
  static const Color primary = Color(0xFF0284C7);

  /// Primary dark variant
  static const Color primaryDark = Color(0xFF0369A1);

  /// Primary light variant
  static const Color primaryLight = Color(0xFFDBEAFE);

  /// Primary container color
  static const Color primaryContainer = Color(0xFFE3F2FD);

  // ============================================================================
  // SECONDARY COLORS
  // ============================================================================

  /// Secondary brand color
  static const Color secondary = Color(0xFF9333EA);

  /// Secondary dark variant
  static const Color secondaryDark = Color(0xFF018786);

  /// Secondary light variant
  static const Color secondaryLight = Color(0xFFF3E8FF);

  /// Secondary container color
  static const Color secondaryContainer = Color(0xFFE0F2F1);

  // ============================================================================
  // SURFACE COLORS
  // ============================================================================

  /// Primary surface color (usually white)
  static const Color surface = Color(0xFFFFFFFF);

  /// Surface variant color
  static const Color surfaceVariant = Color(0xFFF5F5F5);

  /// Surface container color
  static const Color surfaceContainer = Color(0xFFFAFAFA);

  /// Surface container high color
  static const Color surfaceContainerHigh = Color(0xFFF0F0F0);

  // ============================================================================
  // BACKGROUND COLORS
  // ============================================================================

  /// Primary background color
  static const Color background = Color(0xFFFFFFFF);

  /// Secondary background color
  static const Color backgroundGrey = Color(0xFFF9FAFB);

  /// Background variant color
  static const Color backgroundVariant = Color(0xFFFAFAFA);

  /// Dark background color
  static const Color backgroundDark = Color(0xFF1A1A1A);

  // ============================================================================
  // TEXT COLORS
  // ============================================================================

  /// Primary text color (high emphasis)
  static const Color textPrimary = Color(0xFF1F2937);

  /// Secondary text color (medium emphasis)
  static const Color textSecondary = Color(0xFF4B5563);

  /// Tertiary text color (low emphasis)
  static const Color textTertiary = Color(0xFFBDBDBD);

  /// Hint text color
  static const Color textHint = Color(0xFFADAEBC);

  /// Disabled text color
  static const Color textDisabled = Color(0xFFE0E0E0);

  /// On primary text color (text on primary background)
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// On secondary text color (text on secondary background)
  static const Color onSecondary = Color(0xFF000000);

  /// On surface text color (text on surface background)
  static const Color onSurface = Color(0xFF1F2937);

  /// On background text color (text on background)
  static const Color onBackground = Color(0xFF1F2937);

  // ============================================================================
  // BORDER COLORS
  // ============================================================================

  /// Primary border color
  static const Color border = Color(0xFFE0E0E0);

  /// Border variant color
  static const Color borderVariant = Color(0xFFF3F4F6);

  /// Border focus color
  static const Color borderFocus = Color(0xFF0284C7);

  /// Border error color
  static const Color borderError = Color(0xFFF44336);

  // ============================================================================
  // STATUS COLORS
  // ============================================================================

  /// Success color
  static const Color success = Color(0xFF16A34A);

  /// Success light variant
  static const Color successLight = Color(0xFFDCFCE7);

  /// Success dark variant
  static const Color successDark = Color(0xFF15803D);

  /// Warning color
  static const Color warning = Color(0xFFEA580C);

  /// Warning light variant
  static const Color warningLight = Color(0xFFFFEDD5);

  /// Warning dark variant
  static const Color warningDark = Color(0xFFC2410C);

  /// Error color
  static const Color error = Color(0xFFDC2626);

  /// Error light variant
  static const Color errorLight = Color(0xFFFEE2E2);

  /// Error dark variant
  static const Color errorDark = Color(0xFFB91C1C);

  /// Info color
  static const Color info = Color(0xFF2563EB);

  /// Info light variant
  static const Color infoLight = Color(0xFFDBEAFE);

  /// Info dark variant
  static const Color infoDark = Color(0xFF1D4ED8);

  // ============================================================================
  // NEUTRAL COLORS
  // ============================================================================

  /// Black color
  static const Color black = Color(0xFF000000);

  /// White color
  static const Color white = Color(0xFFFFFFFF);

  /// Transparent color
  static const Color transparent = Color(0x00000000);

  /// Grey 50
  static const Color grey50 = Color(0xFFFAFAFA);

  /// Grey 100
  static const Color grey100 = Color(0xFFF5F5F5);

  /// Grey 200
  static const Color grey200 = Color(0xFFEEEEEE);

  /// Grey 300
  static const Color grey300 = Color(0xFFE0E0E0);

  /// Grey 400
  static const Color grey400 = Color(0xFFBDBDBD);

  /// Grey 500
  static const Color grey500 = Color(0xFF9E9E9E);

  /// Grey 600
  static const Color grey600 = Color(0xFF757575);

  /// Grey 700
  static const Color grey700 = Color(0xFF616161);

  /// Grey 800
  static const Color grey800 = Color(0xFF424242);

  /// Grey 900
  static const Color grey900 = Color(0xFF212121);

  // ============================================================================
  // SHADOW COLORS
  // ============================================================================

  /// Light shadow color
  static const Color shadowLight = Color(0x1A000000);

  /// Medium shadow color
  static const Color shadowMedium = Color(0x33000000);

  /// Dark shadow color
  static const Color shadowDark = Color(0x4D000000);

  // ============================================================================
  // OVERLAY COLORS
  // ============================================================================

  /// Light overlay color
  static const Color overlayLight = Color(0x1A000000);

  /// Medium overlay color
  static const Color overlayMedium = Color(0x33000000);

  /// Dark overlay color
  static const Color overlayDark = Color(0x66000000);

  // ============================================================================
  // PRIORITY COLORS
  // ============================================================================

  /// Low priority background color
  static const Color priorityLowBg = Color(0xFFF1F5F9);

  /// Low priority text color
  static const Color priorityLowText = Color(0xFF334155);

  /// Medium priority background color
  static const Color priorityMediumBg = Color(0xFFFEF3C7);

  /// Medium priority text color
  static const Color priorityMediumText = Color(0xFFB45309);

  /// High priority background color
  static const Color priorityHighBg = Color(0xFFFEE2E2);

  /// High priority text color
  static const Color priorityHighText = Color(0xFFB91C1C);

  // ============================================================================
  // UTILITY METHODS
  // ============================================================================

  /// Create a color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color;
  }

  /// Create a color with alpha
  static Color withAlpha(Color color, int alpha) {
    return color.withAlpha(alpha);
  }

  /// Get color from hex string
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Convert color to hex string
  static String toHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
  }
}
