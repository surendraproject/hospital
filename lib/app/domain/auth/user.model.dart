import 'package:get/get.dart';

import '../../data/constants/storage.constants.dart';
import '../../data/interfaces/storage.interface.dart';


class UserModel {
  String? id;
  String? uid;
  String? name;
  String? phone;
  String? address;
  String? token;

  UserModel({
    this.id,
    this.uid,
    this.name,
    this.phone,
    this.address,
    this.token,
  });

  static UserModel? fromStorage() {
    final storage = Get.find<IStorage>();
    final user = storage.read('user');
    final userModel = user != null ? UserModel.fromJson(user) : null;
    return userModel;
  }

  Future<void> save() async {
    final storage = Get.find<IStorage>();
    await storage.write(
      key: StorageConstants.user,
      value: toJson(),
    );
  }

  static Future<void> clear() async {
    final storage = Get.find<IStorage>();
    await storage.write(
      key: StorageConstants.user,
      value: null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'phone': phone,
      'address': address,
      'token': token,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        uid: json['uid'],
        name: json['name'],
        phone: json['phone'],
        address: json['address'],
        token: json['token'],
      );

  UserModel copyWith({
    String? id,
    String? uid,
    String? name,
    String? phone,
    String? address,
    String? token,
  }) =>
      UserModel(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        token: token ?? this.token,
      );
}
