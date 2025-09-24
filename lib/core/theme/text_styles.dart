import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

/// Comprehensive text styles for the entire application
/// This file contains all text styles used throughout the app
/// for consistent typography and easy maintenance
class AppTextStyles {
  // ============================================================================
  // HEADLINE STYLES
  // ============================================================================

  /// Extra large headline - for main page titles
  static TextStyle get headlineExtraLarge => TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  /// Large headline - for section headers
  static TextStyle get headlineLarge => TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  /// Medium headline - for page titles
  static TextStyle get headlineMedium => TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  /// Small headline - for subsection titles
  static TextStyle get headlineSmall => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  // ============================================================================
  // TITLE STYLES
  // ============================================================================

  /// Large title - for card headers, dialog titles
  static TextStyle get titleLarge => TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  /// Medium title - for list item titles, form section headers
  static TextStyle get titleMedium => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  /// Small title - for small headers, labels
  static TextStyle get titleSmall => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // ============================================================================
  // BODY STYLES
  // ============================================================================

  /// Large body text - for important content, descriptions
  static TextStyle get bodyLarge => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  /// Medium body text - for regular content, paragraphs
  static TextStyle get bodyMedium => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  /// Small body text - for secondary content, captions
  static TextStyle get bodySmall => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  // ============================================================================
  // LABEL STYLES
  // ============================================================================

  /// Large label - for form labels, important labels
  static TextStyle get labelLarge => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  /// Medium label - for regular labels
  static TextStyle get labelMedium => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  /// Small label - for small labels, tags
  static TextStyle get labelSmall => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.2,
  );

  // ============================================================================
  // CAPTION STYLES
  // ============================================================================

  /// Caption text - for small descriptions, metadata
  static TextStyle get caption => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.3,
  );

  /// Overline text - for very small text, categories
  static TextStyle get overline => TextStyle(
    fontSize: 9.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.2,
    letterSpacing: 0.5,
  );

  // ============================================================================
  // BUTTON STYLES
  // ============================================================================

  /// Large button text
  static TextStyle get buttonLarge => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.2,
  );

  /// Medium button text
  static TextStyle get buttonMedium => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.2,
  );

  /// Small button text
  static TextStyle get buttonSmall => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.2,
  );

  /// Outlined button text
  static TextStyle get buttonOutlined => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    height: 1.2,
  );

  /// Text button text
  static TextStyle get buttonText => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    height: 1.2,
  );

  // ============================================================================
  // INPUT STYLES
  // ============================================================================

  /// Input field text
  static TextStyle get inputText => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  /// Input field hint text
  static TextStyle get inputHint => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textHint,
    height: 1.4,
  );

  /// Input field label text
  static TextStyle get inputLabel => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  /// Input field error text
  static TextStyle get inputError => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.error,
    height: 1.3,
  );

  // ============================================================================
  // NAVIGATION STYLES
  // ============================================================================

  /// App bar title
  static TextStyle get appBarTitle => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  /// Tab text
  static TextStyle get tabText => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  /// Tab text selected
  static TextStyle get tabTextSelected => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    height: 1.2,
  );

  /// Bottom navigation text
  static TextStyle get bottomNavText => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.2,
  );

  /// Bottom navigation text selected
  static TextStyle get bottomNavTextSelected => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    height: 1.2,
  );

  // ============================================================================
  // CARD STYLES
  // ============================================================================

  /// Card title
  static TextStyle get cardTitle => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  /// Card subtitle
  static TextStyle get cardSubtitle => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  /// Card content
  static TextStyle get cardContent => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  // ============================================================================
  // LIST STYLES
  // ============================================================================

  /// List tile title
  static TextStyle get listTileTitle => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  /// List tile subtitle
  static TextStyle get listTileSubtitle => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  /// List tile trailing
  static TextStyle get listTileTrailing => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.3,
  );

  // ============================================================================
  // STATUS STYLES
  // ============================================================================

  /// Success text
  static TextStyle get successText => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.success,
    height: 1.4,
  );

  /// Warning text
  static TextStyle get warningText => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.warning,
    height: 1.4,
  );

  /// Error text
  static TextStyle get errorText => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.error,
    height: 1.4,
  );

  /// Info text
  static TextStyle get infoText => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.info,
    height: 1.4,
  );

  // ============================================================================
  // SPECIAL STYLES
  // ============================================================================

  /// Welcome text - for welcome screens
  static TextStyle get welcomeText => TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  /// Welcome subtitle
  static TextStyle get welcomeSubtitle => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  /// Loading text
  static TextStyle get loadingText => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  /// Empty state text
  static TextStyle get emptyStateText => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  /// Empty state title
  static TextStyle get emptyStateTitle => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  // ============================================================================
  // UTILITY METHODS
  // ============================================================================

  /// Create a text style with custom color
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  /// Create a text style with custom font weight
  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  /// Create a text style with custom font size
  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size.sp);
  }

  /// Create a text style with custom height
  static TextStyle withHeight(TextStyle style, double height) {
    return style.copyWith(height: height);
  }

  /// Create a text style with custom letter spacing
  static TextStyle withLetterSpacing(TextStyle style, double spacing) {
    return style.copyWith(letterSpacing: spacing);
  }

  /// Create a text style with custom decoration
  static TextStyle withDecoration(TextStyle style, TextDecoration decoration) {
    return style.copyWith(decoration: decoration);
  }

  // ============================================================================
  // COMMON COMBINATIONS
  // ============================================================================

  /// Bold primary text
  static TextStyle get boldPrimary => bodyMedium.copyWith(
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  /// Bold secondary text
  static TextStyle get boldSecondary => bodyMedium.copyWith(
    fontWeight: FontWeight.bold,
    color: AppColors.textSecondary,
  );

  /// Light primary text
  static TextStyle get lightPrimary => bodyMedium.copyWith(
    fontWeight: FontWeight.w300,
    color: AppColors.textPrimary,
  );

  /// Light secondary text
  static TextStyle get lightSecondary => bodyMedium.copyWith(
    fontWeight: FontWeight.w300,
    color: AppColors.textSecondary,
  );

  /// Underlined text
  static TextStyle get underlined =>
      bodyMedium.copyWith(decoration: TextDecoration.underline);

  /// Strikethrough text
  static TextStyle get strikethrough =>
      bodyMedium.copyWith(decoration: TextDecoration.lineThrough);
}
