import 'dart:convert';
import 'package:http/http.dart' as http;

class UrlShortenerService {
  static const String baseUrl = 'https://tinyurl.com/api-create.php';

  Future<String?> shortenUrl(String longUrl) async {
    try{
      final Uri url = Uri.parse('$baseUrl?url=${Uri.encodeComponent(longUrl)}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('Error: Failed to shorten the URL');
        return null;
      }

    } catch(e){
      print('Error: $e');
      return null;
    }
  }
}