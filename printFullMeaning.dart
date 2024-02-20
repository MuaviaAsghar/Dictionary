import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> meaning(String? word) async {
  final apiUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en/$word';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);

    if (data.isNotEmpty) {
      final wordData = data[0];
      final List<dynamic> meanings = wordData['meanings'];
      for (var meaning in meanings) {
        final String? partOfSpeech = meaning['partOfSpeech'];

        print('\nPart of Speech: $partOfSpeech');

        final List<dynamic> definitions = meaning['definitions'];
        for (var definition in definitions) {
          final String? definitionText = definition['definition'];
          final List<dynamic> synonyms = definition['synonyms'];
          final List<dynamic> antonyms = definition['antonyms'];
          final String? example = definition['example'];
          if (definitionText == null) {
            print("No definitions available for word");
          } else {
            print('Definiton: $definitionText');
          }
          if (synonyms.isEmpty) {
            print("No antonyms available.");
          } else {
            print('Synonyms: $synonyms');
          }
          if (antonyms.isEmpty) {
            print("No antonyms available.");
          } else {
            print('Antonyms: $antonyms');
          }
          if (example == null) {
            print("No example available.");
          } else {
            print('Example: $example');
          }
          print("\n ");
        }
      }

      final List<dynamic> sourceUrls = wordData['sourceUrls'];
      print('\nSource URLs: $sourceUrls');
    } else {
      print('No definition found for $word.');
    }
  } else {
    print('Failed to fetch data. Status code: ${response.statusCode}');
  }
}
