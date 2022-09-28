
import 'package:login_signup_mvvm/data/entities.dart';
import 'package:login_signup_mvvm/data/repository.dart';

class SignupUsecase {
  Repository _repository;

  SignupUsecase(Repository repository) {
    _repository = repository;
  }

  void signup(User user, Function onSuccess, Function onError) {
    _repository.signUpUser(user, onSuccess, onError);
  }
}
