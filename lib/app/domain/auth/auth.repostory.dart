import 'package:get/get.dart';
import '../../data/interfaces/storage.interface.dart';
import '../../data/network/network.response.dart';
import '../../data/services/auth.services.dart';
import 'forgetpassword.body.dart';
import 'login.body.dart';
import 'register.body.model.dart';
import 'user.model.dart';

class AuthRepository {
  final AuthService _service;
  final storage = Get.find<IStorage>();

  AuthRepository({required AuthService service}) : _service = service;

  Future<NetworkResponse<UserModel?>> loginUser(
      {required String type,
      required String mobile,
      required String password
      })  async {
    try {
      final body = LoginBody(type: type, phone: mobile, password: password);
      final response = await _service.loginUser(body);
      final user = response.data;
      user?.save();
      return response;
    } catch (err) {
      rethrow;
    }
  }
  
  Future<NetworkResponse> forgetPassword({
    required String mobile,
  }) async {
    try {
      final body = OtpResendBody(type: 'forgot_password', phone: mobile);
      final response = await _service.forgetPassword(body);

      return response;
    } catch (err) {
      rethrow;
    }
  }
  
  Future<NetworkResponse> registerUser({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required String hospitalid,
  }) async {
    try {
      final body = RegisterRequestBody(
        type: 'register',
        name: name,
        email: email,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
        hospitalid: hospitalid,
      );
      final response = await _service.registerUser(body);
      return response;
    } catch (err) {
      rethrow;
    }
  }

}
