class RegisterRequestBody {
  final String type;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final String hospitalid;

  RegisterRequestBody( {
    required this.type,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword, 
    required this. hospitalid,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['confirm_password'] = confirmPassword;
    data['hospital_id'] = hospitalid;
    return data;
  }
}
