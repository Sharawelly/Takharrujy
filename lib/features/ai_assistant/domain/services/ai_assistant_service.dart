import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../data/models/ai_request_model.dart';
import '../../data/models/ai_response_model.dart';

class AiAssistantService {
  static const Duration _processingDelay = Duration(seconds: 2);

  /// Process AI assistance request
  Future<AiResponseModel> processRequest(AiRequestModel request) async {
    // Simulate AI processing delay
    await Future.delayed(_processingDelay);

    // Generate mock response based on assistance type
    return _generateMockResponse(request);
  }

  /// Generate mock AI response
  AiResponseModel _generateMockResponse(AiRequestModel request) {
    final responses = {
      'Code Review': AiResponseModel(
        title: 'Code Review Recommendations',
        content: _getCodeReviewSteps(),
        timestamp: DateTime.now(),
      ),
      'Architecture Design': AiResponseModel(
        title: 'Architecture Design Guidelines',
        content: _getArchitectureSteps(),
        timestamp: DateTime.now(),
      ),
      'Database Design': AiResponseModel(
        title: 'Database Design Recommendations',
        content: _getDatabaseSteps(),
        timestamp: DateTime.now(),
      ),
      'Bug Fixing': AiResponseModel(
        title: 'Bug Fixing Strategies',
        content: _getBugFixingSteps(),
        timestamp: DateTime.now(),
      ),
      'Documentation': AiResponseModel(
        title: 'Documentation Best Practices',
        content: _getDocumentationSteps(),
        timestamp: DateTime.now(),
      ),
      'Best Practices': AiResponseModel(
        title: 'Development Best Practices',
        content: _getBestPracticesSteps(),
        timestamp: DateTime.now(),
      ),
    };

    return responses[request.assistanceType] ?? responses['Best Practices']!;
  }

  List<String> _getCodeReviewSteps() {
    return [
      'Check code readability and maintainability',
      'Verify error handling and edge cases',
      'Review performance implications',
      'Ensure proper documentation',
    ];
  }

  List<String> _getArchitectureSteps() {
    return [
      'Define system requirements and constraints',
      'Choose appropriate architectural patterns',
      'Design component interactions',
      'Plan for scalability and maintainability',
    ];
  }

  List<String> _getDatabaseSteps() {
    return [
      'Start with entity-relationship modeling',
      'Define primary and foreign keys',
      'Apply normalization principles',
      'Plan data integrity constraints',
    ];
  }

  List<String> _getBugFixingSteps() {
    return [
      'Reproduce the bug consistently',
      'Identify the root cause',
      'Write tests to prevent regression',
      'Implement and verify the fix',
    ];
  }

  List<String> _getDocumentationSteps() {
    return [
      'Write clear and concise descriptions',
      'Include code examples and use cases',
      'Keep documentation up to date',
      'Use consistent formatting and style',
    ];
  }

  List<String> _getBestPracticesSteps() {
    return [
      'Follow coding standards and conventions',
      'Write clean, readable code',
      'Implement proper error handling',
      'Use version control effectively',
    ];
  }

  /// Validate AI request
  String? validateRequest(AiRequestModel request) {
    if (request.question.trim().isEmpty) {
      return 'Please enter your question';
    }

    if (request.assistanceType == 'Select help type...') {
      return 'Please select a type of assistance';
    }

    if (request.question.trim().length < 10) {
      return 'Please provide more details in your question';
    }

    return null;
  }

  /// Show success message
  void showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.success,
      ),
    );
  }

  /// Show error message
  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
      ),
    );
  }

  /// Show info message
  void showInfoMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
