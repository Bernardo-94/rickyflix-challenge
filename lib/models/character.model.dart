class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.created,
  });

  final String? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final CharacterLocationModel? origin;
  final CharacterLocationModel? location;
  final String? image;
  final List<CharacterEpisodeModel>? episode;
  final DateTime? created;

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    // ignore: unused_local_variable
    List<CharacterEpisodeModel> episodes = [];

    if (json["episode"] is Map<String, dynamic>) {
      episodes = (json["episode"] as Map<String, dynamic>)
          .values
          .map((e) => CharacterEpisodeModel.fromJson(e))
          .toList();
    } else if (json["episode"] is List<dynamic>) {
      episodes = (json["episode"] as List<dynamic>)
          .map((e) => CharacterEpisodeModel.fromJson(e))
          .toList();
    }

    return CharacterModel(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
      type: json["type"],
      gender: json["gender"],
      origin: CharacterLocationModel.fromJson(json["origin"]),
      location: CharacterLocationModel.fromJson(json["location"]),
      image: json["image"],
      episode: _parseEpisodes(json["episode"]),
      created: DateTime.parse(json["created"]),
    );
  }

  static List<CharacterEpisodeModel>? _parseEpisodes(dynamic episodes) {
    if (episodes == null) {
      return null;
    }
    if (episodes is List) {
      return episodes
          .map((episodeJson) => CharacterEpisodeModel.fromJson(episodeJson))
          .toList();
    } else if (episodes is Map<String, dynamic>) {
      return episodes.values
          .map((episodeJson) => CharacterEpisodeModel.fromJson(episodeJson))
          .toList();
    }
    return null;
  }
}

class CharacterLocationModel {
  CharacterLocationModel({
    required this.name,
    required this.url,
  });

  String? name;
  String? url;

  factory CharacterLocationModel.fromJson(Map<String, dynamic> json) =>
      CharacterLocationModel(
        name: json["name"],
        url: json["url"],
      );
}

class CharacterEpisodeModel {
  CharacterEpisodeModel({
    required this.name,
    required this.typeName,
  });

  final String? name;
  final String? typeName;

  factory CharacterEpisodeModel.fromJson(Map<String, dynamic> json) =>
      CharacterEpisodeModel(name: json["name"], typeName: json['__typename']);
}
