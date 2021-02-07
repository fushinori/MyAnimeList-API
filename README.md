# MyAnimeList-API
API wrapper for MyAnimeList written in Dart.

## Installation
Click [here](https://pub.dev/packages/myanimelist_api/install).

## Get started
You're gonna need an access token to use this wrapper. To find out how to get one, click [here](https://myanimelist.net/blog.php?eid=835707).

```dart
import 'package:myanimelist_api/myanimelist_api.dart';

void main() async {
  // Initialize client
  var client = Client("YOUR_ACCESS_TOKEN");
}
```

## Examples
• Node objects are objects with minimal fields like id, title and main pictures.
  Most methods return nodes (or variations).

```dart
// Search for anime
var animeList = await client.searchAnime("Shingeki no Kyojin");
for (var anime in animeList) {
  print(anime.id); // Most methods return objects with minimal fields
}
```

• Use ID to get complete anime/manga objects.

```dart
// Get complete objects using id
var anime = await client.getAnimeDetails(16498);
assert(anime.title == "Shingeki no Kyojin");
assert(anime.mainPicture.large == "https://api-cdn.myanimelist.net/images/anime/10/47347l.jpg");
assert(anime.genres[0].name == "Action");
assert(anime.createdAt == DateTime.parse("2012-12-05T12:03:21.000Z"));
```

• Use templates for updating lists.

```dart
var template = AnimeListTemplate(
  status: "completed",
  score: 9,
  numWatchedEpisodes: 13
);
await client.updateAnimeList(30015, template);
```

## TODO
- [X] User anime list
- [ ] Forum info
- [X] User manga list
- [ ] User info
