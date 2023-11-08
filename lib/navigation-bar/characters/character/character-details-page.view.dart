import 'package:flutter/material.dart';
import 'package:rickyflix_challenge/models/character.model.dart';
import 'package:rickyflix_challenge/navigation-bar/characters/character/episode/episode-details-page-future.dart';
import 'package:rickyflix_challenge/navigation-bar/custom.page.dart';

class CharacterDetailsPage extends StatefulWidget {
  final CharacterModel character;
  const CharacterDetailsPage({
    super.key,
    required this.character,
  });

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomPage(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                children: [
                  CircleAvatar(
                    radius: 200,
                    backgroundImage: NetworkImage(widget.character.image!),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Name: ${widget.character.name}'),
                      const SizedBox(height: 10),
                      Text('Status: ${widget.character.status}'),
                      const SizedBox(height: 10),
                      Text('Specie: ${widget.character.species}'),
                      const SizedBox(height: 10),
                      Text('Origin: ${widget.character.origin!.name}'),
                      const SizedBox(height: 10),
                      Text('Location: ${widget.character.location!.name}'),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Episodes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 2 / 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: widget.character.episode!.length,
                itemBuilder: (context, index) {
                  var episode = widget.character.episode![index];
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
      ),
    );
  }
}
