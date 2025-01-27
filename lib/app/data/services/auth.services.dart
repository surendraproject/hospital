import 'dart:convert';

import '../../domain/auth/forgetpassword.body.dart';
import '../../domain/auth/login.body.dart';
import '../../domain/auth/register.body.model.dart';
import '../../domain/auth/user.model.dart';
import '../exceptions/default.exception.dart';
import '../exceptions/invalid_body.exception.dart';
import '../exceptions/invalid_token.exception.dart';
import '../exceptions/user_not_found.exception.dart';
import '../interfaces/http_connect.interface.dart';
import '../network/network.response.dart';

class AuthService {
  final IHttpConnect _connect;

  AuthService({required IHttpConnect connect}) : _connect = connect;

  String get _authentication => 'authentication';

  Future<NetworkResponse<UserModel?>> loginUser(LoginBody body) async {
    final response = await _connect.postFormData<NetworkResponse<UserModel?>>(
      _authentication,
      body.toJson(),
      decoder: (value) => NetworkResponse<UserModel?>.fromJson(
        jsonDecode(value) as Map<String, dynamic>,
        (Object? json) => UserModel.fromJson(json as Map<String, dynamic>),
      ),
    );

    if (response.success) {
      switch (response.payload?.status) {
        case '0':
          throw DefaultException(
            message: response.payload?.message ?? 'Unable to connect to server',
          );
        case '1':
          return response.payload!;
        default:
          throw DefaultException(
            message: response.payload?.message ?? 'Unable to connect to server',
          );
      } 
    } else {
      switch (response.statusCode) {
        case 404:
          throw UserNotFoundException();
        case 401:
          throw InvalidTokenException();
        case 500:
          throw InvalidBodyException();
        default:
          throw DefaultException();
      }
    }
  }

  
  Future<NetworkResponse> forgetPassword(OtpResendBody body) async {
    final response = await _connect.postFormData<NetworkResponse>(
      _authentication,
      body.toJson(),
      decoder: (value) => NetworkResponse.fromJson(
        jsonDecode(value) as Map<String, dynamic>,
        (Object? json) => null,
      ),
    );

    if (response.success) {
      switch (response.payload?.status) {
        case '0':
          throw DefaultException(
            message: response.payload?.message ?? 'Unable to connect to server',
          );
        case '1':
          return response.payload!;
        default:
          throw DefaultException(
            message: response.payload?.message ?? 'Unable to connect to server',
          );
      }
    } else {
      switch (response.statusCode) {
        case 404:
          throw UserNotFoundException();
        case 401:
          throw InvalidTokenException();
        case 500:
          throw InvalidBodyException();
        default:
          throw DefaultException();
      }
    }
  }

  
  Future<NetworkResponse> registerUser(RegisterRequestBody body) async {
    final response = await _connect.postFormData<NetworkResponse>(
      _authentication,
      body.toJson(),
      decoder: (value) => NetworkResponse.fromJson(
        jsonDecode(value) as Map<String, dynamic>,
        (Object? json) => null,
      ),
    );

    if (response.success) {
      switch (response.payload?.status) {
        case '0':
          throw DefaultException(
            message: response.payload?.message ?? 'Unable to connect to server',
          );
        case '1':
          return response.payload!;
        default:
          throw DefaultException(
            message: response.payload?.message ?? 'Unable to connect to server',
          );
      }
    } else {
      switch (response.statusCode) {
        case 404:
          throw UserNotFoundException();
        case 401:
          throw InvalidTokenException();
        case 500:
          throw InvalidBodyException();
        default:
          throw DefaultException();
      }
    }
  }
  }