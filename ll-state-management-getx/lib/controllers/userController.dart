import 'package:get/get.dart';
import 'package:robbinlaw/models/user.dart';

class UserController extends GetxController {
  Rx<UserModel> _userStream = Rx<UserModel>();
  UserModel get user => _userStream.value;
  set user(UserModel value) => _userStream.value = value;

  @override
  onInit() {
    super.onInit();
    print('UserController onInit:');
    _userStream.value = UserModel();
    _userStream.update((val) {
      val.name = 'hey man';
      val.count = 2;
    });

    // Called every time the variable $_ is changed
    ever(_userStream, (_) => print("$_ has been changed"));

    // Called first time the variable $_ is changed
    once(_userStream, (_) => print("$_ was changed once"));
  }

  // called after the widget is rendered on screen
  @override
  void onReady() {
    print('UserController onReady:');
    super.onReady();
  }

  // called just before the Controller is deleted
  @override
  void onClose() {
    print('UserController onClose:');
    super.onClose();
  }

  void updateUser(int count) {
    print('UserController updateUser:');
    _userStream.update((val) {
      val.name = 'Robbin';
      val.count = count;
    });
  }
}
