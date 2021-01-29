import 'package:myanimelist_api/myanimelist_api.dart';

void main() async {
  // Initialize client
  var client = Client("YOUR_ACCESS_TOKEN");

  // Search for anime
  var animeList = await client.searchAnime("Shingeki no Kyojin");
  for (var anime in animeList) {
    print(anime.id); // Most methods return objects with minimal fields
  }

  // Get complete objects using id
  var anime = await client.getAnimeDetails(16498);
  assert(anime.title == "Shingeki no Kyojin");
  assert(anime.mainPicture.large == "https://api-cdn.myanimelist.net/images/anime/10/47347l.jpg");
  assert(anime.genres[0].name == "Action");
  assert(anime.createdAt == DateTime.parse("2012-12-05T12:03:21.000Z"));
}
