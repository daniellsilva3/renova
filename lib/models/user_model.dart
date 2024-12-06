import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  String _name = '';
  String _email = '';

  String get name => _name;
  String get email => _email;

  void setUser(String name, String email) {
    _name = name;
    _email = email;
    notifyListeners();
  }
}
