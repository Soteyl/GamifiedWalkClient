import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  String _token = '';
  String _errorMessage = '';
  bool _isLoading = false;

  String get token => _token;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      // Логіка логіну через API
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Новий метод для скидання стану
  void reset() {
    _token = '';
    _errorMessage = '';
    _isLoading = false;
    notifyListeners();
  }
}
