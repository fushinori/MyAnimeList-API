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

import '../anime/anime.dart';
import '../generic/main_picture.dart';
import '../manga/manga.dart';

part 'node.g.dart';

/// [Anime] or [Manga] object with minimal fields.
///
/// Returned by most methods.
/// Use [id] to get the full [Anime] or [Manga] object, if necessary.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Node {
  final int id;
  final String title;
  final MainPicture mainPicture;

  Node(this.id, this.title, this.mainPicture);

  factory Node.fromJson(Map<String, dynamic> json) {
    return _$NodeFromJson(json);
  }
}
