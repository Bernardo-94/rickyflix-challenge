class LocationModel {
  LocationModel({
    required this.id,
    required this.name,
    this.dimension,
  });

  final String? id;
  final String? name;
  String? dimension;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        name: json["name"],
        dimension: json["dimension"],
      );
}
