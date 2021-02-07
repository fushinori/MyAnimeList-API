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

class MangaListTemplate {
  /// 'reading', 'completed', 'on_hold', 'dropped', 'plan_to_read'
  final String status;

  final bool isRereading;

  /// 0-10
  final int score;
  final int numVolumesRead;
  final int numChaptersRead;

  /// 0-2
  final int priority;
  final int numTimesReread;

  /// 0-5
  final int rereadValue;
  final String tags;
  final String comments;

  MangaListTemplate(
      {this.status,
      this.isRereading = false,
      this.score,
      this.numVolumesRead = 0,
      this.numChaptersRead = 0,
      this.priority = 0,
      this.numTimesReread = 0,
      this.rereadValue = 0,
      this.tags = "",
      this.comments = ""});

  Map<String, String> toMap() {
    return {
      'status': status,
      'is_rereading': isRereading.toString(),
      'score': score.toString(),
      'num_volumes_read': numVolumesRead.toString(),
      'num_chapters_read': numChaptersRead.toString(),
      'priority': priority.toString(),
      'num_times_reread': numTimesReread.toString(),
      'reread_value': rereadValue.toString(),
      'tags': tags,
      'comments': comments
    };
  }
}
