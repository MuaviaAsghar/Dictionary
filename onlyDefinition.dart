import 'dart:convert';
import 'package:http/http.dart' as http;

Future definition(String? word) async {
  final apiUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en/$word';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);

    if (data.isNotEmpty) {
      final meanings = data[0]['meanings'];

      for (var meaning in meanings) {
        final List<dynamic> definitions = meaning['definitions'];

        for (var definition in definitions) {
          final String definitionText = definition['definition'];
          print('Definition: $definitionText');
          print(" ");
        }
      }
    } else {
      print('No definition found for $word.');
    }
  } else {
    print("Input not supported or Word not in dictionary.");
    print("Error ${response.statusCode}");
  }
}
