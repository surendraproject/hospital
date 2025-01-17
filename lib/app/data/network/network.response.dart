class NetworkResponse<T> {
  T? data;
  String? status;
  String? message;

  NetworkResponse({
    this.data,
    this.status,
    this.message,
  });

  T? _nullableGenericFromJson(
    Object? input,
    T Function(Object? json) fromJson,
  ) =>
      input == null ? null : fromJson(input);

  Object? _nullableGenericToJson(
    T? input,
    Object? Function(T value) toJson,
  ) =>
      input == null ? null : toJson(input);

  NetworkResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    data = _nullableGenericFromJson(json['data'], fromJsonT);
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => {
        'data': _nullableGenericToJson(data, toJsonT),
        'status': status,
        'message': message,
      };
}
