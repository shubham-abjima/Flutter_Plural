
import 'package:login_signup_mvvm/data/entities.dart';
import 'package:login_signup_mvvm/di.dart';
import 'package:login_signup_mvvm/domain/signup.dart';
import 'package:login_signup_mvvm/domain/validation.dart';

class RegisterViewModel {
  SignupUsecase _signupUsecase = AppManager.instance().signupUsecase();
  ValidationUseCase _validationUseCase =
      AppManager.instance().validationUseCase();

  void signup(
      User user, String repeatedPass, Function onSucces, Function onError) {
    _validationUseCase.validateRegisteration(user, repeatedPass, () {
      _signupUsecase.signup(user, () {
        onSucces();
      }, (message) {
        onError(message);
      });
    }, (message) {
      onError(message);
    });
  }
}
