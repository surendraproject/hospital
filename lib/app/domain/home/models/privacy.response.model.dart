class PrivacyResponseModel {
  final String? description;

  PrivacyResponseModel({
    this.description,
  });

  factory PrivacyResponseModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return PrivacyResponseModel(
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
    };
  }
}
