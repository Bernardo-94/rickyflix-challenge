import 'package:flutter/material.dart';
import 'package:rickyflix_challenge/models/episode.model.dart';
import 'package:rickyflix_challenge/navigation-bar/custom.page.dart';
import 'package:rickyflix_challenge/navigation-bar/episodes/episode/character/character-detail-page-future.view.dart';

class EpisodeDetailedPage extends StatefulWidget {
  final EpisodeModel episode;
  const EpisodeDetailedPage({
    super.key,
    required this.episode,
  });

  @override
  State<EpisodeDetailedPage> createState() => _EpisodeDetailedPageState();
}

class _EpisodeDetailedPageState extends State<EpisodeDetailedPage> {
  @override
  Widget build(BuildContext context) {
    return CustomPage(
      child: SingleChildScrollView(
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
                  const CircleAvatar(
                      radius: 200,
                      backgroundImage: AssetImage('assets/images/login.png')),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Name: ${widget.episode.name}'),
                      const SizedBox(height: 10),
                      Text('Air date: ${widget.episode.airDate}'),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Characters',
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
                itemCount: widget.episode.characters!.length,
                itemBuilder: (context, index) {
                  var character = widget.episode.characters![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CharacterDetailPageFuture(
                                characterId: character.id)),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text(character.name!)),
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
