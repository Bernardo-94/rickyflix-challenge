import 'package:flutter/material.dart';
import 'package:rickyflix_challenge/models/episode.model.dart';
import 'package:rickyflix_challenge/navigation-bar/characters/character/episode/episode-details-page-future.controller.dart';
import 'package:rickyflix_challenge/navigation-bar/custom.page.dart';
import 'package:rickyflix_challenge/navigation-bar/episodes/episode/character/character-detail-page-future.view.dart';

class EpisodeDetailPageFuture extends StatefulWidget {
  final String episodeName;
  const EpisodeDetailPageFuture({
    super.key,
    required this.episodeName,
  });

  @override
  State<EpisodeDetailPageFuture> createState() =>
      _EpisodeDetailPageFutureState();
}

class _EpisodeDetailPageFutureState extends State<EpisodeDetailPageFuture> {
  EpisodeDetailPageFutureController controller =
      EpisodeDetailPageFutureController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EpisodeModel>>(
      future: controller.getEpisode(widget.episodeName),
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
          return Center(child: SelectableText('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No episode available.'));
        } else {
          EpisodeModel episode = snapshot.data!.first;
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
                          backgroundImage:
                              AssetImage('assets/images/login.png'),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Name: ${episode.name}'),
                            const SizedBox(height: 10),
                            Text('Air date: ${episode.airDate}'),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text('Characters',
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
                      itemCount: episode.characters!.length,
                      itemBuilder: (context, index) {
                        var character = episode.characters![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CharacterDetailPageFuture(
                                          characterId: character.id!)),
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
      },
    );
  }
}
