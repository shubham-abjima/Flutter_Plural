

import 'package:login_signup_mvvm/data/repository.dart';
import 'package:login_signup_mvvm/data/repossitoryImpl.dart';
import 'package:login_signup_mvvm/domain/login.dart';
import 'package:login_signup_mvvm/domain/logout.dart';
import 'package:login_signup_mvvm/domain/signup.dart';
import 'package:login_signup_mvvm/domain/userInfo.dart';
import 'package:login_signup_mvvm/domain/validation.dart';

class AppManager {
  static AppManager _instance;
  static Repository _repository = BancherRepository();

  AppManager._();

  static AppManager instance() {
    if (_instance == null) {
      _instance = AppManager._();
    }
    return _instance;
  }

  ValidationUseCase validationUseCase() {
    return ValidationUseCase(_repository);
  }

  SignupUsecase signupUsecase() {
    return SignupUsecase(_repository);
  }

  LoginUsecase loginUsecase() {
    return LoginUsecase(_repository);
  }

  LogoutUsecase logoutUsecase() {
    return LogoutUsecase(_repository);
  }

  bool isLoggedIn() {
    return _repository.isLoggedIn();
  }

  UserInfoUsecase userInfoUsecase() {
    return UserInfoUsecase(_repository);
  }
}
