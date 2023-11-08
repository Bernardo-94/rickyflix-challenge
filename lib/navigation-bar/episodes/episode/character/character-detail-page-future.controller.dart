import 'package:rickyflix_challenge/models/character.model.dart';
import 'package:rickyflix_challenge/services/rickyflix.service.dart';

class CharacterDetailPageFutureController {
  RickyFlixService service = RickyFlixService();

  Future<CharacterModel?> getCharacterById(String id) async {
    return service.fetchCharacterById(id);
  }

  Future<List<CharacterModel>> getCharacterByName(String name) async {
    return service.fetchCharacterByName(name);
  }
}
