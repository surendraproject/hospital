class TermesCondistionResponseModel {
  final String? description;

  TermesCondistionResponseModel({
    this.description,
  });

  factory TermesCondistionResponseModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return TermesCondistionResponseModel(
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
    };
  }
}
