
import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier{

  bool _checkEmail = false;
  bool _checkPass = false;


  bool get checkPass => _checkPass;

  set checkPass(bool value) {
    _checkPass = value;
  }

  bool get checkEmail => _checkEmail;

  set checkEmail(bool value) {
    _checkEmail = value;
  }

  void checkEmails (String value){
    _checkEmail = (value.contains('@') && value.contains('.com')) ? true : false;
    notifyListeners();
  }
  void checkPassword (String value){
    _checkPass = (value.length > 4) ? true : false;
    notifyListeners();
  }

}