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

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../exceptions.dart';

/// Handles all requests to the API.
class RequestHandler {
  late http.Client _client;
  String baseUrl;
  Map<String, String>? headers;

  RequestHandler(this.baseUrl, this.headers) {
    _client = http.Client();
  }

  Future<dynamic> call(
      {String? uri,
      String method = "get",
      Map<String, String>? params,
      Map<String, String?>? body}) async {
    var finalUrl = "$baseUrl$uri${Uri(queryParameters: params)}";
    if (method == "get") {
      var response = await _client.get(Uri.parse(finalUrl), headers: headers);
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return json;
      } else {
        var message = json["message"] ?? "";
        var error = json["error"] ?? "";
        throw ApiException(response.statusCode, message, error);
      }
    } else if (method == "patch") {
      var response = await _client.patch(Uri.parse(finalUrl),
          headers: headers, body: body);
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return true;
      } else {
        var message = json["message"] ?? "";
        var error = json["error"] ?? "";
        throw ApiException(response.statusCode, message, error);
      }
    } else if (method == "delete") {
      var response =
          await _client.delete(Uri.parse(finalUrl), headers: headers);
      var json = jsonDecode(response.body);
      var code = response.statusCode;
      if ({404, 200}.contains(code)) {
        return code;
      } else {
        var message = json["message"] ?? "";
        var error = json["error"] ?? "";
        throw ApiException(code, message, error);
      }
    }
  }
}
