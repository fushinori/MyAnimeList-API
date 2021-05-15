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

// ignore_for_file: avoid_positional_boolean_parameters

import 'package:json_annotation/json_annotation.dart';

import '../../helpers/date_conversion.dart';

part 'my_list_status.g.dart';

/// Manga list status of the authorized user for the anime.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class MyMangaListStatus {
  final String? status;
  final bool? isRereading;
  final int? numVolumesRead;
  final int? numChaptersRead;
  final int? score;

  @JsonKey(fromJson: stringToDate)
  final DateTime? updatedAt;

  MyMangaListStatus(this.status, this.isRereading, this.numVolumesRead,
      this.score, this.numChaptersRead, this.updatedAt);

  factory MyMangaListStatus.fromJson(Map<String, dynamic> json) {
    return _$MyMangaListStatusFromJson(json);
  }
}
