import 'package:rickyflix_challenge/models/episode.model.dart';
import 'package:rickyflix_challenge/services/rickyflix.service.dart';

class EpisodesPageController {
  List<EpisodeModel>? episodes = [];
  RickyFlixService service = RickyFlixService();

  Future<List<EpisodeModel>> getEpisodes() async {
    return service.fetchAllEpisodes();
  }
}
