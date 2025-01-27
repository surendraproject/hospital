class OtpResendBody {
  final String type;
  final String phone;

  OtpResendBody({required this.type, required this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['phone'] = phone;
    return data;
  }
}