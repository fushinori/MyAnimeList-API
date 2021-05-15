/* 
 * Copyright (C) 2021 Real Phoenix <https://github.com/rsktg>
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:myanimelist_api/myanimelist_api.dart';

void main() async {
  // Initialize client
  var client = Client("YOUR_ACCESS_TOKEN");

  // Search for anime
  var animeList = await client.searchAnime("Shingeki no Kyojin");
  for (var anime in animeList) {
    print(anime!.id); // Most methods return objects with minimal fields
  }

  // Get complete objects using id
  var anime = await client.getAnimeDetails(16498);
  assert(anime.title == "Shingeki no Kyojin");
  assert(anime.mainPicture!.large ==
      "https://api-cdn.myanimelist.net/images/anime/10/47347l.jpg");
  assert(anime.genres![0].name == "Action");
  assert(anime.createdAt == DateTime.parse("2012-12-05T12:03:21.000Z"));

  // Use templates for updating lists
  var template =
      AnimeListTemplate(status: "completed", score: 9, numWatchedEpisodes: 13);
  await client.updateAnimeList(30015, template);
}
