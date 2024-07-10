import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpInterceptor extends http.BaseClient {
  final http.Client _client;
  final BuildContext _context;

  HttpInterceptor(this._client, this._context);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final response = await _client.send(request);

    if (response.statusCode == 401) {
      _navigateToRefreshPage();
    }

    return response;
  }

  void _navigateToRefreshPage() {
    Navigator.of(_context).pushReplacementNamed('/refreshTokenPage');
  }
}
