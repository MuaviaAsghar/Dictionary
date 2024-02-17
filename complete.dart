import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> definition(String? word) async {
  final apiUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en/$word';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);

    if (data.isNotEmpty) {
      final meaning = data[0]['meanings'][0]['definitions'][0]['definition'];
      print('Definition of $word: $meaning');
    } else {
      print('No definition found for $word.');
    }
  } else {
    print('Failed to fetch data. Status code: ${response.statusCode}');
  }
}
