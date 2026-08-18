/// Simulates submitting form data (enrollment, feedback, registration)
/// to a backend. Stands in for a real API call.
class SubmissionService {
  /// Toggle to true to simulate a failed submission (e.g. dropped
  /// connection) and exercise the inline error banner + retry flow.
  static bool simulateFailure = false;

  static Future<void> submit({
    Duration delay = const Duration(seconds: 2),
  }) async {
    await Future.delayed(delay);

    if (simulateFailure) {
      throw SubmissionException(
        'Submission failed. Please check your connection and try again.',
      );
    }
  }
}

class SubmissionException implements Exception {
  final String message;
  SubmissionException(this.message);

  @override
  String toString() => message;
}
