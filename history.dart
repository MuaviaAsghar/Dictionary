import 'dart:io';

addToHistory(String? word) {
  final historyFile = File('history.txt');

  if (!historyFile.existsSync()) {
    historyFile.createSync();
  }

  final existingContent = historyFile.readAsStringSync();

  final newContent = '$existingContent\n$word';

  historyFile.writeAsStringSync(newContent);
}

showHistory() {
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
  print("To rerun type run in terminal.");
  print("To terminate program type end in terminal.");
  print("");
}

deleteHistory() {
  final historyFile = File('history.txt');
  if (historyFile.existsSync()) {
    historyFile.delete();
  } else {
    print("File already didn't exist");
  }
}
