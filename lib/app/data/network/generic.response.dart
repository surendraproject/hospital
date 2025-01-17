class GenericResponse {
  String? message;

  GenericResponse({this.message});

  factory GenericResponse.fromJson(Map<String, dynamic> json) =>
      GenericResponse(message: json['message']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
