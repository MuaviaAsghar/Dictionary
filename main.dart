import 'enumFunction.dart';
import 'dart:io';
import 'onlyDefinition.dart';
import 'about.dart';
import 'help.dart';
import 'printFullMeaning.dart';
import 'history.dart';
import 'showloading.dart';

Future<void> main() async {
  print("Welcome");
  print('------------');
  print("1. Meaning");
  print("2. Definitions");
  print("3. History");
  print("4. About");
  print("5. Help");
  print("6. Exit");

  print("");

  print(
      "Tip => If you want to rerun the program after one function type **run** in terminal");

  print("");
  print(
      "Tip => If you want to terminate the program after one function type **end** in terminal");
  print("");

  stdout.write("Enter the name function you want to use:");
  String userInput = stdin.readLineSync()!;
  String lowercase = userInput.toString().toLowerCase();

  print("");

  dict? userChoice = dict.values
      .firstWhere((func) => func.toString().split('.').last == lowercase);

  switch (userChoice) {
    case dict.meaning:
      print("");
      stdout.write("Enter the word for full meaning:");
      final word = stdin.readLineSync();
      showLoading();
      await Future.delayed(const Duration(seconds: 3));
      await meaning(word);
      await addToHistory(word);

      final rerun = stdin.readLineSync();
      if (rerun == 'run') {
        return main();
      } else if (rerun == 'end') {
        exit(0);
      }
      break;
    case dict.definition:
      print("");
      stdout.write("Enter the word for all possible defenition:");
      final word = stdin.readLineSync();
      showLoading();
      await Future.delayed(const Duration(seconds: 3));
      await definition(word);
      await addToHistory(word);

      final rerun = stdin.readLineSync();
      if (rerun == 'run') {
        return main();
      } else if (rerun == 'end') {
        exit(0);
      }
      break;
    case dict.history:
      showHistory();
      print("");
      print("");
      print("Clear History");
      print("");
      print("");
      print("If you want to clear history type `Clear` in terminal");
      print("");
      print("");

      final delete = stdin.readLineSync();
      if (delete == "Clear") {
        deleteHistory();
      }
      return main();

    case dict.about:
      await about();

      final rerun = stdin.readLineSync();
      if (rerun == 'run') {
        return main();
      } else if (rerun == 'end') {
        exit(0);
      }
      break;
    case dict.help:
      await help();
      final rerun = stdin.readLineSync();

      if (rerun == 'run') {
        return main();
      } else if (rerun == 'end') {
        exit(0);
      }
    case dict.exit:
      await exit(0);

    default:
      print("Invalid choice. Please enter a number between 1 and 5.");

      final rerun = stdin.readLineSync();

      rerun == 'run' ? main() : (rerun == 'end' ? exit(0) : null);
  }
}
