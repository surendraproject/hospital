class LoginBody {
  final String type;
  final String phone;
  final String password;

  LoginBody(
      {required this.type, required this.phone, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['phone'] = phone;
    data['password'] = password;
    return data;
  }
}
