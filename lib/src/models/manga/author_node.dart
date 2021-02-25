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

part 'author_node.g.dart';

/// Info about the particular author.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class AuthorNode {
  final int id;
  final String firstName;
  final String lastName;

  AuthorNode(this.id, this.firstName, this.lastName);

  factory AuthorNode.fromJson(Map<String, dynamic> json) {
    return _$AuthorNodeFromJson(json);
  }
}
