import 'package:flutter/material.dart';
import 'package:rickyflix_challenge/models/episode.model.dart';
import 'package:rickyflix_challenge/navigation-bar/custom.page.dart';
import 'package:rickyflix_challenge/navigation-bar/episodes/episode/episode-detailed-page.view.dart';
import 'package:rickyflix_challenge/navigation-bar/episodes/episodes-page.controller.dart';

class EpisodesPage extends StatefulWidget {
  const EpisodesPage({super.key});

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  EpisodesPageController controller = EpisodesPageController();
  List<EpisodeModel> episodes = [];
  @override
  Widget build(BuildContext context) {
    return CustomPage(
        child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        _buildSearchForm(),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: FutureBuilder<List<EpisodeModel>>(
            future: controller.getEpisodes(),
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
                return const Center(child: Text('No episodes available.'));
              } else {
                episodes = snapshot.data!;
                return _buildGridView(episodes);
              }
            },
          ),
        ),
      ],
    ));
  }

  Widget _buildGridView(List<EpisodeModel> list) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.0,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        EpisodeModel episode = episodes[index];
        var counter = index % 2;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EpisodeDetailedPage(episode: episode)),
            );
          },
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    counter == 0
                        ? 'assets/images/login.png'
                        : 'assets/images/morty.jpg',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  episode.name!,
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

  Widget _buildSearchForm() {
    return Wrap(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Flexible(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Flexible(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Episode code',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Buscar'),
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Limpar filtros'),
        ),
      ],
    );
  }
}
