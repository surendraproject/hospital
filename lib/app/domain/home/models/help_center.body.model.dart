// class HelpCenterBody {
//   final String type;
//   final String name;
//   final String email;
//   final String topic;
//   final String description;

//   HelpCenterBody({
//     required this.type,
//     required this.name,
//     required this.email,
//     required this.topic,
//     required this.description,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['type'] = type;
//     data['name'] = name;
//     data['email'] = email;
//     data['topic'] = topic;
//     data['description'] = description;
//     return data;
//   }
// }


class HelpCenterBody {
  final String type;
  final String name;
  final String email;
  final String topic;
  final String description;

  HelpCenterBody({
    required this.type,
    required this.name,
    required this.email,
    required this.topic,
    required this.description,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'name': name,
      'email': email,
      'topic': topic,
      'description': description,
    };
  }
}
