import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rickyflix_challenge/constants/constants.dart';
import 'package:rickyflix_challenge/models/character.model.dart';
import 'package:rickyflix_challenge/models/episode.model.dart';
import 'package:rickyflix_challenge/models/location.model.dart';

class RickyFlixService {
  late GraphQLClient _client;

  RickyFlixService() {
    final HttpLink httpLink = HttpLink(
      apiRickyFlix,
    );

    _client = GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: httpLink,
    );
  }

  Future<List<EpisodeModel>> fetchAllEpisodesByPage(int page) async {
    String query = '''
      query {
        episodes(page: $page) {
          results {
            id
            name
            air_date
            episode
            characters {
              id
              name
            }
            __typename
          }
        }
      }
    ''';

    final QueryOptions options = QueryOptions(document: gql(query));

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> episodeData = result.data?['episodes']['results'] ?? [];

    return episodeData.map((json) => EpisodeModel.fromJson(json)).toList();
  }

  Future<CharacterModel> fetchCharacterById(String id) async {
    String query = '''
    query {
      character(id: $id) {
        id
        name
        status
        species
        type
        gender
        origin {
          name
        }
        location {
          name
        }
        image
        episode {
          name
        }
        created
      }
    }
  ''';

    final QueryOptions options = QueryOptions(document: gql(query));

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final Map<String, dynamic> characterData = result.data?['character'] ?? {};

    if (characterData.isEmpty) {
      throw Exception('Character not found');
    }

    return CharacterModel.fromJson(characterData);
  }

  Future<List<CharacterModel>> fetchCharacterByName(String name) async {
    String query = '''
    query {
      characters(filter: { name: "$name" }) {
        results {
          id
          name
          status
          species
          type
          gender
          origin {
            name
          }
          location {
            name
          }
          image
          episode {
            name
          }
        }
      }
    }
  ''';

    final QueryOptions options = QueryOptions(document: gql(query));

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final dynamic characterData = result.data?['characters']['results'] ?? [];

    if (characterData.isEmpty) {
      throw Exception('Character not found');
    }

    if (characterData is List) {
      return characterData
          .map((json) => CharacterModel.fromJson(json))
          .toList();
    } else if (characterData is Map<String, dynamic>) {
      return [CharacterModel.fromJson(characterData)];
    } else {
      throw Exception('Invalid character data format');
    }
  }

  Future<List<EpisodeModel>> fetchAllEpisodes() async {
    List<EpisodeModel> allEpisodes = [];
    int currentPage = 1;
    bool hasNextPage = true;

    while (hasNextPage) {
      try {
        List<EpisodeModel> episodes = await fetchAllEpisodesByPage(currentPage);
        if (episodes.isNotEmpty) {
          allEpisodes.addAll(episodes);
          currentPage++;
        } else {
          hasNextPage = false;
        }
      } catch (e) {
        hasNextPage = false;
      }
    }
    return allEpisodes;
  }

  Future<List<CharacterModel>> fetchAllCharactersByPage(int page) async {
    String query = '''
      query {
        characters(page: $page) {
          results {
            id
            name
            status
            species
            type
            gender
            origin {
              name
            }
            location {
              name
            }
            image
            episode {
              name
            }
            created
          }
        }
      }
    ''';

    final QueryOptions options = QueryOptions(document: gql(query));

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> characterData =
        result.data?['characters']['results'] ?? [];

    return characterData.map((json) => CharacterModel.fromJson(json)).toList();
  }

  Future<List<CharacterModel>> fetchAllCharacters() async {
    List<CharacterModel> allCharacters = [];
    int currentPage = 1;
    bool hasNextPage = true;

    while (hasNextPage) {
      try {
        List<CharacterModel> characters =
            await fetchAllCharactersByPage(currentPage);
        if (characters.isNotEmpty) {
          allCharacters.addAll(characters);
          currentPage++;
        } else {
          hasNextPage = false;
        }
      } catch (e) {
        hasNextPage = false;
      }
    }

    return allCharacters;
  }

  Future<List<EpisodeModel>> fetchEpisodesByName(String name) async {
    String query = '''
    query {
      episodes(filter: { name: "$name" }) {
        results {
          id
          name
          air_date
          episode
          characters {
            id
            name
          }
        }
      }
    }
   ''';

    final QueryOptions options = QueryOptions(document: gql(query));

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> episodeData = result.data?['episodes']['results'] ?? [];

    if (episodeData.isEmpty) {
      throw Exception('Episodes not found');
    }

    return episodeData.map((json) => EpisodeModel.fromJson(json)).toList();
  }

  Future<List<CharacterModel>> fetchAllCharactersFilteredsByPage({
    int? page,
    String? name,
    String? gender,
    String? status,
    String? location,
  }) async {
    String filters = '';

    String query = '''
      query {
         characters(
          filter: { 
            name: "$name",
            gender: "$gender",
            status: "$status",}) {
          results {
            id
            name
            status
            species
            type
            gender
            origin {
              name
            }
            location {
              name
            }
            image
            episode {
              name
            }
            created
          }
        }
      }
    ''';

    final QueryOptions options = QueryOptions(document: gql(query), variables: {
      'filters': filters,
    });
    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> characterData =
        result.data?['characters']['results'] ?? [];

    return characterData.map((json) => CharacterModel.fromJson(json)).toList();
  }

  Future<List<CharacterModel>> fetchAllCharactersFiltereds({
    String? name,
    String? gender,
    String? status,
    String? location,
  }) async {
    List<CharacterModel> allCharacters = [];
    int currentPage = 1;
    bool hasNextPage = true;

    while (hasNextPage) {
      try {
        List<CharacterModel> characters =
            await fetchAllCharactersFilteredsByPage(
          page: currentPage,
          name: name,
          gender: gender,
          status: status,
          location: location,
        );
        if (characters.isNotEmpty) {
          allCharacters.addAll(characters);
          currentPage++;
        } else {
          hasNextPage = false;
        }
      } catch (e) {
        hasNextPage = false;
      }
    }

    return allCharacters;
  }

  Future<List<LocationModel>> fetchAllLocationsBypage(int page) async {
    String query = '''
    query {
      locations(page: $page) {
        results {
          id
          name
          dimension
        }
      }
    }
  ''';

    final QueryOptions options = QueryOptions(document: gql(query));

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> locationData =
        result.data?['locations']['results'] ?? [];

    return locationData.map((json) => LocationModel.fromJson(json)).toList();
  }

  Future<List<LocationModel>> fetchAllLocations() async {
    List<LocationModel> allLocations = [];
    int currentPage = 1;
    bool hasNextPage = true;

    while (hasNextPage) {
      try {
        List<LocationModel> locations =
            await fetchAllLocationsBypage(currentPage);
        if (locations.isNotEmpty) {
          allLocations.addAll(locations);
          currentPage++;
        } else {
          hasNextPage = false;
        }
      } catch (e) {
        hasNextPage = false;
      }
    }

    return allLocations;
  }
}
