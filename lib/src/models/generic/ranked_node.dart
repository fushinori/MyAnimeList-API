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

import 'node.dart';
import 'ranking.dart';

part 'ranked_node.g.dart';

/// [Node] object with [ranking] field.
@JsonSerializable(createToJson: false)
class RankedNode {
  final Node? node;
  final Ranking? ranking;

  RankedNode(this.node, this.ranking);

  factory RankedNode.fromJson(Map<String, dynamic> json) {
    return _$RankedNodeFromJson(json);
  }
}
