class AboutResponseModel {
  final String? description;

  AboutResponseModel({
    this.description,
  });

  factory AboutResponseModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return AboutResponseModel(
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
    };
  }
}
