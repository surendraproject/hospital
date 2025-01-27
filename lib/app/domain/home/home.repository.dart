import 'package:get/get.dart';
import 'package:hospital/app/domain/home/models/help_center.body.model.dart';
import 'package:hospital/app/domain/home/models/terme.response.dart';

import '../../data/interfaces/storage.interface.dart';
import '../../data/network/generic.response.dart';
import '../../data/network/generic_body.dart';
import '../../data/services/home.service.dart';
import 'models/about.response.model.dart';
import 'models/contect.response.model.dart';
import 'models/privacy.response.model.dart';

class HomeRepository {
  final HomeService _service;
  final storage = Get.find<IStorage>();

  HomeRepository({required HomeService service}) : _service = service;

  Future<AboutResponseModel?> getAboutData() async {
    try {
      final body = GenericBody(
        type: 'get_about_description',
      );
      final response = await _service.getAboutData(body);

      return response.data;
    } catch (err) {
      rethrow;
    }
  }

  Future<ContactResponse?> getContactData() async {
    try {
      final body = GenericBody(
        type: 'get_contact_details',
      );
      final response = await _service.getContactData(body);

      return response.data;
    } catch (err) {
      rethrow;
    }
  }

  Future<PrivacyResponseModel?> getPrivacyData() async {
    try {
      final body = GenericBody(
        type: 'fetch_privacy_policy',
      );
      final response = await _service.getprivacyData(body);

      return response.data;
    } catch (err) {
      rethrow;
    }
  }

  Future<TermesCondistionResponseModel?> gettermesData() async {
    try {
      final body = GenericBody(
        type: 'fetch_terms_conditions',
      );
      final response = await _service.gettermscondistionData(body);
      return response.data;
    } catch (err) {
      rethrow;
    }
  }

  Future<GenericResponse?> getHelpCenterData({
    required String name,
    required String email,
    required String topic,
    required String description,
  }) async {
    try {
      final body = HelpCenterBody(
        type: 'submit_help_request',
        name: name,
        email: email,
        topic: topic,
        description: description,
      );

      final response = await _service.gethelpcenterData(body);

      return response.data;
    } catch (error) {
      print('Error in getHelpCenterData: $error');

      rethrow;
    }
  }
}
