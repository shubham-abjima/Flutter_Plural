
import 'package:login_signup_mvvm/di.dart';
import 'package:login_signup_mvvm/domain/logout.dart';
import 'package:login_signup_mvvm/domain/userInfo.dart';

class HomeViewModel {
  LogoutUsecase _logoutUsecase = AppManager.instance().logoutUsecase();
  UserInfoUsecase _userInfoUsecase = AppManager.instance().userInfoUsecase();

  void logout(Function then) {
    _logoutUsecase.logout(then);
  }

  void showUserInfo(Function info) {
    _userInfoUsecase.loadUserInfo(info);
  }
}
