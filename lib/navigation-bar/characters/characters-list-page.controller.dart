import 'package:flutter/material.dart';
import 'package:rickyflix_challenge/models/character.model.dart';
import 'package:rickyflix_challenge/models/location.model.dart';
import 'package:rickyflix_challenge/services/rickyflix.service.dart';

class CharactersListPageController {
  TextEditingController locationController = TextEditingController();

  List<String> locationsNames = [];
  RickyFlixService service = RickyFlixService();

  String get location => locationController.text;
  set location(String value) => locationController.text = value;

  Future<void> initController() async {
    getLocations();
    getCharacters();
  }

  Future<List<CharacterModel>> getCharacters() async {
    return service.fetchAllCharacters();
  }

  Future<List<CharacterModel>> getCharactersByFilters({
    String? name,
    String? gender,
    String? status,
  }) async {
    return service.fetchAllCharactersFiltereds(
      name: name,
      gender: gender,
      status: status,
    );
  }

  Future<List<String>> getLocations() async {
    List<LocationModel> locations = await service.fetchAllLocations();
    locationsNames = locations.map((e) => e.name!).toList();
    location = (locationsNames.isNotEmpty ? locationsNames.first : null)!;

    return locationsNames;
  }
}
