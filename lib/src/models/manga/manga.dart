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

import 'package:json_annotation/json_annotation.dart';

import '../../helpers/date_conversion.dart';
import '../generic/alternative_titles.dart';
import '../generic/genre.dart';
import '../generic/main_picture.dart';
import '../generic/picture.dart';
import '../generic/recommendation.dart';
import '../generic/relation.dart';
import 'author.dart';
import 'my_list_status.dart';
import 'serialization.dart';

part 'manga.g.dart';

/// Complete manga object with all fields.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Manga {
  final int? id;
  final String? title;
  final MainPicture? mainPicture;
  final AlternativeTitles? alternativeTitles;

  @JsonKey(fromJson: stringToDate)
  final DateTime? startDate;

  @JsonKey(fromJson: stringToDate)
  final DateTime? endDate;

  final String? synopsis;
  final double? mean;
  final int? rank;
  final int? popularity;
  final int? numListUsers;
  final int? numScoringUsers;
  final String? nsfw;

  @JsonKey(fromJson: stringToDate)
  final DateTime? createdAt;

  @JsonKey(fromJson: stringToDate)
  final DateTime? updatedAt;

  final String? mediaType;
  final String? status;
  final List<Genre>? genres;
  final MyMangaListStatus? myListStatus;
  final int? numVolumes;
  final int? numChapters;
  final List<Author>? authors;
  final List<Picture>? pictures;
  final String? background;
  final List<Relation>? relatedAnime;
  final List<Relation>? relatedManga;
  final List<Recommendation>? recommendations;
  final List<Serialization>? serialization;

  Manga(
      this.id,
      this.title,
      this.mainPicture,
      this.alternativeTitles,
      this.startDate,
      this.endDate,
      this.synopsis,
      this.mean,
      this.rank,
      this.popularity,
      this.numListUsers,
      this.numScoringUsers,
      this.nsfw,
      this.createdAt,
      this.updatedAt,
      this.mediaType,
      this.status,
      this.genres,
      this.myListStatus,
      this.numVolumes,
      this.numChapters,
      this.authors,
      this.pictures,
      this.background,
      this.relatedAnime,
      this.relatedManga,
      this.recommendations,
      this.serialization);

  factory Manga.fromJson(Map<String, dynamic> json) {
    return _$MangaFromJson(json);
  }
}
