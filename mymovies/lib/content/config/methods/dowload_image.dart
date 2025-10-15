import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mymovies/content/config/api/config.dart';

Future<String?> getBase64ImageFromUrl(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl),
      headers: {"Authorization": "Bearer ${ApiValues.apiKey}"});
  if (response.statusCode != 200) return null;

  final base64Image = base64Encode(response.bodyBytes);

  return base64Image;
}
