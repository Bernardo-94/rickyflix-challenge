class EpisodeModel {
  EpisodeModel({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    this.typeName,
  });

  final String? id;
  final String? name;
  final String? airDate;
  final String? episode;
  final List<EpisodeCharacterModel>? characters;
  final String? typeName;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    // ignore: unused_local_variable
    List<EpisodeCharacterModel> characters = [];

    if (json["episode"] is Map<String, dynamic>) {
      characters = (json["episode"] as Map<String, dynamic>)
          .values
          .map((e) => EpisodeCharacterModel.fromJson(e))
          .toList();
    } else if (json["episode"] is List<dynamic>) {
      characters = (json["episode"] as List<dynamic>)
          .map((e) => EpisodeCharacterModel.fromJson(e))
          .toList();
    }

    return EpisodeModel(
      id: json["id"],
      name: json["name"],
      airDate: json["air_date"],
      episode: json["episode"],
      characters: _parseCharacters(json['characters']),
      typeName: json['__typename'],
    );
  }

  static List<EpisodeCharacterModel>? _parseCharacters(dynamic episodes) {
    if (episodes == null) {
      return null;
    }
    if (episodes is List) {
      return episodes
          .map((episodeJson) => EpisodeCharacterModel.fromJson(episodeJson))
          .toList();
    } else if (episodes is Map<String, dynamic>) {
      return episodes.values
          .map((episodeJson) => EpisodeCharacterModel.fromJson(episodeJson))
          .toList();
    }
    return null;
  }
}

class EpisodeCharacterModel {
  EpisodeCharacterModel({
    required this.id,
    required this.name,
    this.typeName,
  });

  final String? id;
  final String? name;
  final String? typeName;

  factory EpisodeCharacterModel.fromJson(Map<String, dynamic> json) {
    return EpisodeCharacterModel(
      id: json['id'],
      name: json['name'],
      typeName: json['__typename'],
    );
  }
}
