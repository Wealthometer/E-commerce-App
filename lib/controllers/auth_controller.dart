import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {

  final _storage = GetStorage();

  final RxBool _isFirstTime = true.obs;
  final RxBool _isLoggedIn = false.obs;

  bool get isFirstTime => _isFirstTime.value;
  bool get isLoggedIn => _isLoggedIn.value;

  @override
  void onInit() {
    super.onInit();
    _loadInitialState();
  }

  void _loadInitialState(){
    _isFirstTime.value = _storage.read('isFirstTime') ?? true;
    _isLoggedIn.value = _storage.read('isLoggedIn') ?? false; 
  }

  void setFirstTimeDone(){
    _isFirstTime.value = false;
    _storage.write('isFirstTime', false);
  }

  void login(){
    _isLoggedIn.value = true;
    _storage.write('isLoggedIn', true);
  }

  void logout(){
    _isLoggedIn.value = false;
    _storage.write('key', false);
  }

}


/*
* import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final _storage = GetStorage();

  final RxBool _isFirstTime = true.obs;
  final RxBool _isLoggedIn = false.obs;

  bool get isFirstTime => _isFirstTime.value;
  bool get isLoggedIn => _isLoggedIn.value;

  @override
  void onInit() {
    super.onInit();
    _loadInitialState();
  }

  void _loadInitialState() {
    _isFirstTime.value = _storage.read('isFirstTime') ?? true;
    _isLoggedIn.value = _storage.read('isLoggedIn') ?? false;
  }

  void setFirstTimeDone() {
    _isFirstTime.value = false;
    _storage.write('isFirstTime', false);
  }


  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));


    const validEmail = "test@example.com";
    const validPassword = "123456";

    if (email == validEmail && password == validPassword) {
      _isLoggedIn.value = true;
      _storage.write('isLoggedIn', true);
      return true;
    } else {
      return false;
    }
  }

  void logout() {
    _isLoggedIn.value = false;
    _storage.write('isLoggedIn', false);
  }
}
*/