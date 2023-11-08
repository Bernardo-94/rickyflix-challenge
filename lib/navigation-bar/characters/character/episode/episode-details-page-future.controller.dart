import 'package:rickyflix_challenge/models/episode.model.dart';
import 'package:rickyflix_challenge/services/rickyflix.service.dart';

class EpisodeDetailPageFutureController {
  RickyFlixService service = RickyFlixService();

  Future<List<EpisodeModel>> getEpisode(String name) async {
    return service.fetchEpisodesByName(name);
  }
}
