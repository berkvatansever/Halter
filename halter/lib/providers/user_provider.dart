import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:halter/resources/auth_methods.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;
//kullanıcıyı güncel tutuyor
  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
