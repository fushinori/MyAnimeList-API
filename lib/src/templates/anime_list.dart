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

/// Template for updating anime list.
class AnimeListTemplate {
  /// Possible values: 'watching', 'completed', 'on_hold', 'dropped',
  /// 'plan_to_watch'.
  final String status;

  final bool isRewatching;

  /// Possible values: 0-10
  final int score;
  final int numWatchedEpisodes;

  /// Possible values: 0-2
  final int priority;
  final int numTimesRewatched;

  /// Possible values: 0-5
  final int rewatchValue;
  final String tags;
  final String comments;

  AnimeListTemplate(
      {this.status,
      this.isRewatching = false,
      this.score,
      this.numWatchedEpisodes = 0,
      this.priority = 0,
      this.numTimesRewatched = 0,
      this.rewatchValue = 0,
      this.tags = "",
      this.comments = ""});

  /// Returns map for encoding as form fields.
  Map<String, String> toMap() {
    return {
      'status': status,
      'is_rewatching': isRewatching.toString(),
      'score': score.toString(),
      'num_watched_episodes': numWatchedEpisodes.toString(),
      'priority': priority.toString(),
      'num_times_rewatched': numTimesRewatched.toString(),
      'rewatch_value': rewatchValue.toString(),
      'tags': tags,
      'comments': comments
    };
  }
}
