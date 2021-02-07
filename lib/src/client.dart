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

import 'helpers/request_handler.dart';
import 'models/anime/anime.dart';
import 'models/generic/generic_response.dart';
import 'models/generic/node.dart';
import 'models/generic/ranked_node.dart';
import 'models/generic/ranked_response.dart';
import 'models/lists/anime_list.dart';
import 'models/lists/animelist_response.dart';
import 'models/lists/manga_list.dart';
import 'models/lists/mangalist_response.dart';
import 'models/manga/manga.dart';
import 'templates/anime_list.dart';
import 'templates/manga_list.dart';

/// Main MyAnimeList client
class Client {
  /// Base URL for all requests.
  final String baseUrl = "https://api.myanimelist.net/v2/";

  RequestHandler _handler;
  Map<String, String> _headers;

  /// See https://myanimelist.net/blog.php?eid=835707.
  String accessToken;

  final Set<String> _animeFields = {
    "id",
    "title",
    "main_picture",
    "alternative_titles",
    "start_date",
    "end_date",
    "synopsis",
    "mean",
    "rank",
    "popularity",
    "num_list_users",
    "num_scoring_users",
    "nsfw",
    "created_at",
    "updated_at",
    "media_type",
    "status",
    "genres",
    "my_list_status",
    "num_episodes",
    "start_season",
    "broadcast",
    "source",
    "average_episode_duration",
    "rating",
    "pictures",
    "background",
    "related_anime",
    "related_manga",
    "recommendations",
    "studios",
    "statistics"
  };

  final Set<String> _mangaFields = {
    "id",
    "title",
    "main_picture",
    "alternative_titles",
    "start_date",
    "end_date",
    "synopsis",
    "mean",
    "rank",
    "popularity",
    "num_list_users",
    "num_scoring_users",
    "nsfw",
    "created_at",
    "updated_at",
    "media_type",
    "status",
    "genres",
    "my_list_status",
    "num_volumes",
    "num_chapters",
    "authors{first_name,last_name}",
    "pictures",
    "background",
    "related_anime",
    "related_manga",
    "recommendations",
    "serialization"
  };

  final Set<String> _animeRankingTypes = {
    "all",
    "airing",
    "upcoming",
    "tv",
    "ova",
    "movie",
    "special",
    "bypopularity",
    "favorite"
  };

  final Set<String> _seasons = {"winter", "spring", "summer", "fall"};

  final Set<String> _sortOptions = {"anime_score", "anime_num_list_users"};

  final Set<String> _mangaRankingTypes = {
    "all",
    "manga",
    "oneshots",
    "doujin",
    "lightnovels",
    "novels",
    "manhwa",
    "manhua",
    "bypopularity",
    "favorite"
  };

  Client(this.accessToken) {
    _headers = {'Authorization': 'Bearer $accessToken'};
    _handler = RequestHandler(baseUrl, _headers);
  }

  /// Returns list of [Node] objects based on [keyword].
  ///
  /// Max [limit] is 100.
  Future<List<Node>> searchAnime(String keyword,
      {int limit = 10, int offset = 0}) async {
    var uri = "anime";
    var params = {'q': keyword, 'limit': '$limit', 'offset': '$offset'};
    var json = await _handler.call(uri: uri, params: params);
    var response = GenericResponse.fromJson(json);
    return response.data.map((e) => e.node).toList();
  }

  /// Returns complete [Anime] object.
  Future<Anime> getAnimeDetails(int id) async {
    var uri = "anime/$id";
    var params = {'fields': _animeFields.join(",")};
    var json = await _handler.call(uri: uri, params: params);
    return Anime.fromJson(json);
  }

  /// Returns list of [RankedNode] objects.
  ///
  /// Valid values for [rankingType] include:
  /// 'all', 'airing', 'upcoming', 'tv', 'ova', 'movie',
  /// 'special', 'bypopularity' and 'favorite'.
  ///
  /// Max [limit] is 500.
  ///
  /// Throws [ArgumentError] if [rankingType] is invalid.
  Future<List<RankedNode>> getAnimeRanking(
      {String rankingType = "all", int limit = 10, int offset = 0}) async {
    var uri = "anime/ranking";
    if (!_animeRankingTypes.contains(rankingType.toLowerCase())) {
      throw ArgumentError.value(rankingType, "rankingType");
    }
    var params = {
      'ranking_type': rankingType,
      'limit': '$limit',
      'offset': '$offset'
    };
    var json = await _handler.call(uri: uri, params: params);
    var response = RankedResponse.fromJson(json);
    return response.data;
  }

  /// Returns list of [Node] objects based on [year] and [season].
  ///
  /// Valid values for [season] include:
  /// 'winter', 'summer', 'spring' and 'fall'.
  ///
  /// Valid values for [sort] include:
  /// 'anime_score' and 'anime_num_list_users'.
  ///
  /// Throws [ArgumentError] if [season] or [sort] is invalid.
  Future<List<Node>> getSeasonalAnime(int year, String season,
      {String sort = "anime_score", int limit = 10, int offset = 0}) async {
    if (!_seasons.contains(season.toLowerCase())) {
      throw ArgumentError.value(season, "season");
    }
    if (!_sortOptions.contains(sort.toLowerCase())) {
      throw ArgumentError.value(sort, "sort");
    }
    var uri = "anime/season/$year/$season";
    var params = {'sort': sort, 'limit': '$limit', 'offset': '$offset'};
    var json = await _handler.call(uri: uri, params: params);
    var response = GenericResponse.fromJson(json);
    return response.data.map((e) => e.node).toList();
  }

  /// Returns list of suggested [Node] objects for the authorized user.
  Future<List<Node>> getSuggestedAnime({int limit = 10, int offset = 0}) async {
    var uri = "anime/suggestions";
    var params = {'limit': '$limit', 'offset': '$offset'};
    var json = await _handler.call(uri: uri, params: params);
    var response = GenericResponse.fromJson(json);
    return response.data.map((e) => e.node).toList();
  }

  /// Returns list of [Node] objects based on [keyword].
  ///
  /// Max [limit] is 100.
  Future<List<Node>> searchManga(String keyword,
      {int limit = 10, int offset = 0}) async {
    var uri = "manga";
    var params = {'q': keyword, 'limit': '$limit', 'offset': '$offset'};
    var json = await _handler.call(uri: uri, params: params);
    var response = GenericResponse.fromJson(json);
    return response.data.map((e) => e.node).toList();
  }

  /// Returns complete [Manga] object.
  Future<Manga> getMangaDetails(int id) async {
    var uri = "manga/$id";
    var params = {'fields': _mangaFields.join(",")};
    var json = await _handler.call(uri: uri, params: params);
    return Manga.fromJson(json);
  }

  /// Returns list of [RankedNode] objects.
  ///
  /// Valid values for [rankingType] include:
  /// 'all', 'manga', 'oneshots', 'doujin', 'lightnovels',
  /// 'novels', 'manhua', 'manhwa', 'bypopularity' and 'favorite'.
  ///
  /// Max [limit] is 500.
  ///
  /// Throws [ArgumentError] if [rankingType] is invalid.
  Future<List<RankedNode>> getMangaRanking(
      {String rankingType = "all", int limit = 10, int offset = 0}) async {
    var uri = "manga/ranking";
    if (!_mangaRankingTypes.contains(rankingType.toLowerCase())) {
      throw ArgumentError.value(rankingType, "rankingType");
    }
    var params = {
      'ranking_type': rankingType,
      'limit': '$limit',
      'offset': '$offset'
    };
    var json = await _handler.call(uri: uri, params: params);
    var response = RankedResponse.fromJson(json);
    return response.data;
  }

  /// Updates anime list with anime of [id].
  ///
  /// Returns [true] on success.
  Future<bool> updateAnimeList(int id, AnimeListTemplate list) async {
    var uri = "anime/$id/my_list_status";
    var result =
        await _handler.call(method: "patch", uri: uri, body: list.toMap());
    return result;
  }

  /// Deletes anime of [id] from anime list.
  ///
  /// Returns [true] on success and [false] if the anime
  /// is not in the list.
  Future<bool> deleteAnimeFromList(int id) async {
    var uri = "anime/$id/my_list_status";
    var result = await _handler.call(method: "delete", uri: uri);
    return result == 200 ? true : false;
  }

  /// Returns anime list of [username].
  ///
  /// [username] defaults to '@me' which is the authorized user.
  ///
  /// Valid values for [status] include:
  /// 'watching', 'completed', 'on_hold', 'dropped'
  /// and 'plan_to_watch'.
  /// Don't specify [status] to return all anime.
  ///
  /// Valid values for [sort] include:
  /// 'list_score', 'list_updated_at', 'anime_title' and
  /// 'anime_start_date'.
  ///
  /// Max [limit] is 1000.
  Future<List<AnimeList>> getAnimeList(
      {String username = "@me",
      String status = "",
      String sort = "",
      int limit = 10,
      int offset = 0}) async {
    var uri = "users/$username/animelist";
    var params = {
      if (status.isNotEmpty) 'status': status,
      if (sort.isNotEmpty) 'sort': sort,
      'limit': '$limit',
      'offset': '$offset',
      'fields': 'list_status'
    };
    var json = await _handler.call(uri: uri, params: params);
    var response = AnimeListResponse.fromJson(json);
    return response.data;
  }

  /// Updates manga list with manga of [id].
  ///
  /// Returns [true] on success.
  Future<bool> updateMangaList(int id, MangaListTemplate list) async {
    var uri = "manga/$id/my_list_status";
    var result =
        await _handler.call(method: "patch", uri: uri, body: list.toMap());
    return result;
  }

  /// Deletes manga of [id] from manga list.
  ///
  /// Returns [true] on success and [false] if the manga
  /// is not in the list.
  Future<bool> deleteMangaFromList(int id) async {
    var uri = "manga/$id/my_list_status";
    var result = await _handler.call(method: "delete", uri: uri);
    return result == 200 ? true : false;
  }

  /// Returns manga list of [username].
  ///
  /// [username] defaults to '@me' which is the authorized user.
  ///
  /// Valid values for [status] include:
  /// 'reading', 'completed', 'on_hold', 'dropped'
  /// and 'plan_to_read'.
  /// Don't specify [status] to return all manga.
  ///
  /// Valid values for [sort] include:
  /// 'list_score', 'list_updated_at', 'manga_title' and
  /// 'manga_start_date'.
  ///
  /// Max [limit] is 1000.
  Future<List<MangaList>> getMangaList(
      {String username = "@me",
      String status = "",
      String sort = "",
      int limit = 10,
      int offset = 0}) async {
    var uri = "users/$username/mangalist";
    var params = {
      if (status.isNotEmpty) 'status': status,
      if (sort.isNotEmpty) 'sort': sort,
      'limit': '$limit',
      'offset': '$offset',
      'fields': 'list_status'
    };
    var json = await _handler.call(uri: uri, params: params);
    var response = MangaListResponse.fromJson(json);
    return response.data;
  }
}
