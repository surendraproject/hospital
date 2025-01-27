class ContactResponse {
  String? phoneNo;
  String? email;
  String? address;
  dynamic location;

  ContactResponse({
    this.phoneNo,
    this.email,
    this.address,
    this.location,
  });

  ContactResponse.fromJson(Map<String, dynamic> json) {
    phoneNo = json['phone'];
    email = json['email'];
    address = json['address'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['phone_no'] = phoneNo;
    data['email'] = email;
    data['address'] = address;
    data['location'] = location;
    return data;
  }
}
