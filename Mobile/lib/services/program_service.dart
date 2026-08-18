import '../main.dart';

/// Simulates a network call to fetch programs.
///
/// This stands in for the real API/JSON integration (Role 1's work).
/// Once that's wired up, swap the body of [fetchPrograms] for a real
/// http/dio call — the loading/error contract (Future + throw) stays
/// the same, so screens using this service won't need to change.
class ProgramService {
  /// Toggle this to true to simulate a network failure and exercise
  /// the error/retry UI without needing to actually kill your connection.
  static bool simulateFailure = false;

  static Future<List<Program>> fetchPrograms() async {
    await Future.delayed(const Duration(milliseconds: 900));

    if (simulateFailure) {
      throw ProgramFetchException(
        'Unable to reach the server. Please check your connection.',
      );
    }

    return dummyPrograms;
  }

  static Future<Program> fetchProgramById(int id) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (simulateFailure) {
      throw ProgramFetchException('Unable to load program details.');
    }

    return dummyPrograms.firstWhere(
      (p) => p.id == id,
      orElse: () => dummyPrograms.first,
    );
  }
}

class ProgramFetchException implements Exception {
  final String message;
  ProgramFetchException(this.message);

  @override
  String toString() => message;
}
