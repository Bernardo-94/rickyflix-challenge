import 'package:flutter/material.dart';
import 'package:rickyflix_challenge/constants/constants.dart';
import 'package:rickyflix_challenge/models/character.model.dart';
import 'package:rickyflix_challenge/navigation-bar/characters/character/character-details-page.view.dart';
import 'package:rickyflix_challenge/navigation-bar/characters/characters-list-page.controller.dart';
import 'package:rickyflix_challenge/navigation-bar/custom.page.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({super.key});

  @override
  State<CharactersListPage> createState() => _CharactersListPage();
}

class _CharactersListPage extends State<CharactersListPage> {
  final CharactersListPageController controller =
      CharactersListPageController();
  List<CharacterModel> characters = [];
  List<String> selectedTags = [];
  String? selectedGender;
  String? selectedStatus;
  String? selectedLocation;
  int? selectedId;
  bool isSearchCkicked = false;
  bool isdDetailed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          FutureBuilder<List<String>>(
            future: controller.getLocations(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                    child: SelectableText('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No characters available.'));
              } else {
                return _buildSearchForm();
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          _buildTagsRow(selectedTags),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder<List<CharacterModel>>(
              future: isSearchCkicked
                  ? controller.getCharactersByFilters(
                      gender: selectedGender,
                      status: selectedStatus,
                      location: selectedLocation,
                    )
                  : controller.getCharacters(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Image.asset(
                      'assets/images/loading.gif',
                      width: 600,
                      height: 600,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                      child: SelectableText('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No characters available.'));
                } else {
                  characters = snapshot.data!;
                  return _buildGridView(characters);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchForm() {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flexible(
            child: DropdownButtonFormField<int>(
              value: selectedId,
              onChanged: (value) {
                setState(() {
                  if (selectedTags.contains('$value')) {
                  } else {
                    selectedId = value;
                    selectedTags.add('$value');
                  }
                });
              },
              items: List.generate(183, (index) => index + 1)
                  .map((id) => DropdownMenuItem<int>(
                        value: id,
                        child: Text('$id'),
                      ))
                  .toList(),
              decoration: const InputDecoration(
                labelText: 'Id',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: DropdownButtonFormField<String>(
              value: selectedStatus,
              onChanged: (value) {
                setState(() {
                  if (selectedTags.contains('$value')) {
                  } else {
                    selectedStatus = value;
                    selectedTags.add('$value');
                  }
                });
              },
              items: characterStatus
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              decoration: const InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: DropdownButtonFormField<String>(
              value: controller.location,
              onChanged: (value) {
                setState(() {
                  if (selectedTags.contains('$value')) {
                  } else {
                    selectedLocation = value;
                    selectedTags.add('$value');
                  }
                });
              },
              items: controller.locationsNames
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              decoration: const InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: DropdownButtonFormField<String>(
              value: selectedGender,
              onChanged: (value) {
                setState(() {
                  if (selectedTags.contains('$value')) {
                  } else {
                    selectedTags.add('$value');
                  }
                });
              },
              items: characterGender
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        ElevatedButton(
          onPressed: _searchCharacters,
          child: const Text('Buscar'),
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: _clearFilters,
          child: const Text('Limpar filtros'),
        ),
      ],
    );
  }

  Widget _tag(String tagName, List<String> tagList) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue[200], // Cor de fundo azul claro
        borderRadius: BorderRadius.circular(10), // Borda arredondada
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tagName,
            style: const TextStyle(
              color: Colors.black, // Cor do texto preto
              fontSize: 16,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildTagsRow(List<String> tags) {
    return Wrap(
      children: tags.map((e) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _tag(e, tags),
        );
      }).toList(),
    );
  }

  Widget _buildGridView(List<CharacterModel> list) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.0,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        CharacterModel character = characters[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CharacterDetailsPage(character: character)),
            );
          },
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(character.image!),
                ),
                const SizedBox(height: 10),
                Text(
                  character.name!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _searchCharacters() {
    setState(() {
      isSearchCkicked = true;
    });
  }

  void _clearFilters() {
    setState(() {
      selectedTags.clear();
      isSearchCkicked = false;
    });
  }
}
