import 'dart:io';
import 'onlyDefinition.dart';
import 'about.dart';
import 'help.dart';
import 'printFullMeaning.dart';
import 'history.dart';

Future<void> main() async {
  print("Welcome");
  print('------------');
  print("1.Get full meaning of the word.");
  print("2.Get only definnitions of the word.");
  print("3.History");
  print("4.Help");
  print("5.About me");
  print("");
  stdout.write("Enter the number corresponding to your choice:");

  final number = stdin.readLineSync();
  if (number == '1') {
    stdout.write("Enter the word for full meaning:");
    final word = stdin.readLineSync();
    await meaning(word);
    await addToHistory(word);
  } else if (number == '2') {
    stdout.write("Enter the word for full meaning:");
    final word = stdin.readLineSync();
    await definition(word);
    await addToHistory(word);
  } else if (number == '3') {
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
    } else {
      print("You're good to go");
    }
  } else if (number == '4') {
    await about();
  } else if (number == '5') {
    await help();
  } else {
    print("Invalid choice. Please enter a number between 1 and 5.");
  }
}
