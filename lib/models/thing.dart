class Thing {
  String name;
  int count = 0;

  Thing({
    required this.name,
  });

  Thing.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        count = json['count'];
}
