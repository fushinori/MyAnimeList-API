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

import 'dart:io' show Platform, sleep;

import 'package:test/test.dart';
import 'package:myanimelist_api/myanimelist_api.dart';

void main() {
  Client client;

  setUpAll(() {
    client = Client(Platform.environment['MAL_ACCESS_TOKEN']);
  });

  // Sleep a bit between tests
  setUp(() {
    sleep(const Duration(seconds: 1));
  });

  group("[Anime]", () {
    test("Search for anime with keyword", () async {
      var animeList = await client.searchAnime("one", limit: 5);
      expect(animeList.length, 5);
      var anime = animeList[0];
      expect(anime.id, 21);
      expect(anime.mainPicture.large,
          "https://api-cdn.myanimelist.net/images/anime/6/73245l.jpg");
    });

    test("Get complete anime info", () async {
      var anime = await client.getAnimeDetails(30230);
      expect(anime.title, "Diamond no Ace: Second Season");
      expect(anime.genres[0].name, "Comedy");
      expect(anime.relatedAnime[0].node.id, 18689);
      expect(anime.createdAt, DateTime.parse("2015-03-02T06:03:11+00:00"));
    });

    test("Get anime ranking", () async {
      var animeList = await client.getAnimeRanking(limit: 5, offset: 3);
      expect(animeList.length, 5);
      expect(animeList[0].ranking.rank, 4);
    });

    test("Test invalid arguments for anime ranking", () async {
      expect(() async {
        await client.getAnimeRanking(rankingType: "invalid");
      }, throwsArgumentError);
    });

    test("Get seasonal anime", () async {
      var animeList = await client.getSeasonalAnime(2018, "winter");
      expect(animeList.length, 10);
    });

    test("Test invalid arguments for seasonal anime", () async {
      expect(() async {
        await client.getSeasonalAnime(2017, "summer", sort: "invalid");
      }, throwsArgumentError);
      expect(() async {
        await client.getSeasonalAnime(2017, "invalid");
      }, throwsArgumentError);
    });

    test("Get suggested anime", () async {
      var animeList = await client.getSuggestedAnime();
      expect(animeList, isA<List<Node>>());
    });
  });

  group("[Manga]", () {
    test("Search for manga with keyword", () async {
      var mangaList = await client.searchManga("berserk", limit: 3);
      expect(mangaList.length, 3);
      var manga = mangaList[0];
      expect(manga.id, 2);
      expect(manga.title, "Berserk");
    });

    test("Get complete manga info", () async {
      var manga = await client.getMangaDetails(2);
      expect(manga.title, "Berserk");
      expect(manga.alternativeTitles.synonyms[0], "Berserk: The Prototype");
      expect(manga.startDate, DateTime.parse("1989-08-25"));
      expect(manga.genres[0].name, "Action");
      expect(manga.authors[0].node.firstName, "Kentarou");
    });

    test("Get manga ranking", () async {
      var mangaList = await client.getMangaRanking(limit: 5, offset: 3);
      expect(mangaList.length, 5);
      expect(mangaList[0].ranking.rank, 4);
    });

    test("Test invalid arguments for manga ranking", () async {
      expect(() async {
        await client.getMangaRanking(rankingType: "invalid");
      }, throwsArgumentError);
    });
  });

  group("[Anime list]", () {
    test("Update anime list", () async {
      var list = AnimeListTemplate(
          status: "completed", score: 6, numWatchedEpisodes: 25);
      var response = await client.updateAnimeList(69, list);
      expect(response, true);
    });

    test("Delete from anime list", () async {
      var response = await client.deleteAnimeFromList(69);
      expect(response, true);
    });

    test("Get user anime list", () async {
      var anime = (await client.getAnimeList())[0];
      expect(anime.node.title, "Kimi no Na wa.");
      expect(anime.listStatus.score, 9);
    });
  });

  group("[Manga list]", () {
    test("Update manga list", () async {
      var list =
          MangaListTemplate(status: "dropped", score: 3, numChaptersRead: 1);
      var response = await client.updateMangaList(69, list);
      expect(response, true);
    });

    test("Delete from manga list", () async {
      var response = await client.deleteMangaFromList(69);
      expect(response, true);
    });

    test("Get user manga list", () async {
      var anime = (await client.getMangaList())[0];
      expect(anime.node.title, "ReLIFE");
      expect(anime.listStatus.score, 10);
    });
  });
}
