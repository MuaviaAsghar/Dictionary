import 'dart:io';

void addToHistory(String word) {
  final historyFile = File('history.txt');

  if (!historyFile.existsSync()) {
    historyFile.createSync();
  }

  // Read existing content, if any
  final existingContent = historyFile.readAsStringSync();

  // Append the new word to the existing content
  final newContent = '$existingContent\n$word';

  // Write the updated content back to the file
  historyFile.writeAsStringSync(newContent);

  print('Search history updated.');
}

void showHistory() {
  final historyFile = File('history.txt');

  if (!historyFile.existsSync()) {
    print('No search history available.');
    return;
  }

  final historyContent = historyFile.readAsStringSync();

  if (historyContent.isEmpty) {
    print('No search history available.');
  } else {
    print('Search History:');
    print(historyContent);
  }
}
