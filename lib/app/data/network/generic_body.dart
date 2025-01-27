class GenericBody {
  final String type;
  // final String? hospital_id;

  GenericBody({
    required this.type,
    // this.hospital_id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    // data['hospital_id'] = hospital_id;
    return data;
  }
}
