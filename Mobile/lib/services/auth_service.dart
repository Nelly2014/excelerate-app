/// Lightweight in-memory auth store.
///
/// This is a stand-in for real authentication until Role 1 wires up
/// a real backend/API. It lets Login and Registration talk to each
/// other so the app behaves correctly for a demo: you must register
/// before you can sign in, and wrong credentials are rejected.
///
/// NOTE: this resets every time the app restarts — nothing is persisted.
class AuthService {
  static final Map<String, String> _registeredUsers = {};

  static final RegExp _emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  static bool isValidEmail(String email) => _emailRegex.hasMatch(email);

  /// Registers a new account. Throws [AuthException] if the email is
  /// already registered.
  static void register(String email, String password) {
    final normalizedEmail = email.trim().toLowerCase();
    if (_registeredUsers.containsKey(normalizedEmail)) {
      throw AuthException('An account with this email already exists.');
    }
    _registeredUsers[normalizedEmail] = password;
  }

  /// Validates sign-in credentials against registered accounts.
  /// Throws [AuthException] with a user-facing message on failure.
  static void login(String email, String password) {
    final normalizedEmail = email.trim().toLowerCase();

    if (!isValidEmail(normalizedEmail)) {
      throw AuthException('Please enter a valid email address.');
    }

    if (!_registeredUsers.containsKey(normalizedEmail)) {
      throw AuthException(
        'No account found with this email. Please create an account first.',
      );
    }

    if (_registeredUsers[normalizedEmail] != password) {
      throw AuthException('Incorrect password. Please try again.');
    }
  }

  /// For demo/testing convenience: seeds a default demo account so
  /// the app can be signed into without registering first.
  static void seedDemoAccount() {
    _registeredUsers.putIfAbsent('demo@excelerate.org', () => 'Demo1234');
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}
