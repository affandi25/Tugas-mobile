import 'package:flutter/foundation.dart';
import '../models/user_model.dart';

class AuthService extends ChangeNotifier {
  static final AuthService instance = AuthService._internal();
  AuthService._internal() {
    _initDefaultUser();
  }

  // Akun bawaan (Default User Yusuf Affandi)
  static const UserModel defaultUser = UserModel(
    id: 'u1',
    name: 'Yusuf Affandi',
    email: 'Akusayangkamu@gmail.com',
    phone: '081234567890',
    bio: 'Pecinta Donat Manis & Dessert',
    gender: 'Laki-laki',
    birthDate: '25 Mei 2004',
    avatarPath: 'asset/yusuf.jpeg',
  );

  final Map<String, String> _userPasswords = {
    'akusayangkamu@gmail.com': '12345678',
  };

  final Map<String, UserModel> _users = {
    'akusayangkamu@gmail.com': defaultUser,
  };

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;

  void _initDefaultUser() {
    _currentUser = defaultUser;
  }

  // 1. Fungsi Login
  Future<bool> login(String email, String password) async {
    final normalizedEmail = email.trim().toLowerCase();
    final storedPassword = _userPasswords[normalizedEmail];

    if (storedPassword != null && storedPassword == password.trim()) {
      _currentUser = _users[normalizedEmail];
      notifyListeners();
      return true;
    }

    // Fallback: Jika pengguna baru pertama kali login dengan password apapun
    if (_users.containsKey(normalizedEmail)) {
      _currentUser = _users[normalizedEmail];
      notifyListeners();
      return true;
    }

    // Buat sesi otomatis jika belum terdaftar
    final newUser = UserModel(
      id: 'u_${DateTime.now().millisecondsSinceEpoch}',
      name: email.split('@').first,
      email: email.trim(),
    );
    _users[normalizedEmail] = newUser;
    _userPasswords[normalizedEmail] = password.trim();
    _currentUser = newUser;
    notifyListeners();
    return true;
  }

  // 2. Fungsi Register
  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final normalizedEmail = email.trim().toLowerCase();
    final newUser = UserModel(
      id: 'u_${DateTime.now().millisecondsSinceEpoch}',
      name: name.trim(),
      email: email.trim(),
    );

    _users[normalizedEmail] = newUser;
    _userPasswords[normalizedEmail] = password.trim();
    notifyListeners();
    return true;
  }

  // 3. Fungsi Update Profil
  void updateProfile(UserModel updatedUser) {
    final normalizedEmail = updatedUser.email.trim().toLowerCase();
    _users[normalizedEmail] = updatedUser;
    _currentUser = updatedUser;
    notifyListeners();
  }

  // 4. Fungsi Logout
  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
