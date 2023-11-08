import 'package:flutter/material.dart';
import 'package:rickyflix_challenge/models/character.model.dart';
import 'package:rickyflix_challenge/navigation-bar/characters/character/episode/episode-details-page-future.dart';
import 'package:rickyflix_challenge/navigation-bar/custom.page.dart';
import 'package:rickyflix_challenge/navigation-bar/episodes/episode/character/character-detail-page-future.controller.dart';

class CharacterDetailPageFuture extends StatefulWidget {
  final String? characterId;
  final String? characterName;
  const CharacterDetailPageFuture({
    super.key,
    this.characterId,
    this.characterName,
  });

  @override
  State<CharacterDetailPageFuture> createState() =>
      _CharacterDetailPageFutureState();
}

class _CharacterDetailPageFutureState extends State<CharacterDetailPageFuture> {
  CharacterDetailPageFutureController controller =
      CharacterDetailPageFutureController();

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      child: FutureBuilder<CharacterModel?>(
        future: controller.getCharacterById(widget.characterId!),
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
              child: SelectableText('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No chatacter available.'));
          } else {
            CharacterModel character = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 200,
                          backgroundImage: NetworkImage(character.image!),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Name: ${character.name}'),
                            const SizedBox(height: 10),
                            Text('Status: ${character.status}'),
                            const SizedBox(height: 10),
                            Text('Specie: ${character.species}'),
                            const SizedBox(height: 10),
                            Text('Origin: ${character.origin!.name}'),
                            const SizedBox(height: 10),
                            Text('Location: ${character.location!.name}'),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text('Episodes',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 150,
                        childAspectRatio: 2 / 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: character.episode!.length,
                      itemBuilder: (context, index) {
                        var episode = character.episode![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EpisodeDetailPageFuture(
                                        episodeName: episode.name!,
                                      )),
                            );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(episode.name!)),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
