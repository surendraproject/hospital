import 'dart:convert';

import 'package:hospital/app/data/exceptions/default.exception.dart';
import 'package:hospital/app/domain/home/models/privacy.response.model.dart';
import 'package:logger/web.dart';

import '../../domain/home/models/about.response.model.dart';
import '../../domain/home/models/contect.response.model.dart';
import '../../domain/home/models/help_center.body.model.dart';
import '../../domain/home/models/terme.response.dart';
import '../exceptions/invalid_body.exception.dart';
import '../exceptions/invalid_token.exception.dart';
import '../exceptions/user_not_found.exception.dart';
import '../interfaces/http_connect.interface.dart';
import '../network/generic.response.dart';
import '../network/generic_body.dart';
import '../network/network.response.dart';

class HomeService {
  final IHttpConnect _connect;

  HomeService({required IHttpConnect connect}) : _connect = connect;

  String get _pages => 'pages';

  Future<NetworkResponse<AboutResponseModel?>> getAboutData(
      GenericBody body) async {
    final response =
        await _connect.postFormData<NetworkResponse<AboutResponseModel?>>(
      _pages,
      body.toJson(),
      decoder: (value) => NetworkResponse<AboutResponseModel?>.fromJson(
        jsonDecode(value) as Map<String, dynamic>,
        (Object? json) =>
            AboutResponseModel.fromJson(json as Map<String, dynamic>),
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

  Future<NetworkResponse<ContactResponse?>> getContactData(
      GenericBody body) async {
    final response =
        await _connect.postFormData<NetworkResponse<ContactResponse?>>(
      _pages,
      body.toJson(),
      decoder: (value) => NetworkResponse<ContactResponse?>.fromJson(
        jsonDecode(value) as Map<String, dynamic>,
        (Object? json) =>
            ContactResponse.fromJson(json as Map<String, dynamic>),
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

  Future<NetworkResponse<PrivacyResponseModel?>> getprivacyData(
      GenericBody body) async {
    final response =
        await _connect.postFormData<NetworkResponse<PrivacyResponseModel?>>(
      _pages,
      body.toJson(),
      decoder: (value) => NetworkResponse<PrivacyResponseModel?>.fromJson(
        jsonDecode(value) as Map<String, dynamic>,
        (Object? json) =>
            PrivacyResponseModel.fromJson(json as Map<String, dynamic>),
      ),
    );

    print('Request Payload: ${body.toJson()}');

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

  Future<NetworkResponse<TermesCondistionResponseModel?>>
      gettermscondistionData(GenericBody body) async {
    final response = await _connect
        .postFormData<NetworkResponse<TermesCondistionResponseModel?>>(
      _pages,
      body.toJson(),
      decoder: (value) =>
          NetworkResponse<TermesCondistionResponseModel?>.fromJson(
        jsonDecode(value) as Map<String, dynamic>,
        (Object? json) => TermesCondistionResponseModel.fromJson(
            json as Map<String, dynamic>),
      ),
    );
    Logger().d('Request Payload: ${body.toJson()}');

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

  Future<NetworkResponse<GenericResponse?>>
      gethelpcenterData(HelpCenterBody body) async {
    final response = await _connect
        .postFormData<NetworkResponse<GenericResponse?>>(
      _pages,
      body.toJson(),
      decoder: (value) =>
          NetworkResponse<GenericResponse?>.fromJson(
        jsonDecode(value) as Map<String, dynamic>,
        (Object? json) => GenericResponse.fromJson(
            json as Map<String, dynamic>),
      ),
    );
    Logger().d('Request Payload: ${body.toJson()}');

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
