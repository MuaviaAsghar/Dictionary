import 'dart:io';
import 'onlyDefinition.dart';
import 'aboutme.dart';
import 'help.dart';
import 'printFullMeaning.dart';
import 'history.dart';

void main() async {
  print("Welcome");
  print('------------');
  print("1.Get full meaning of the word.");
  print("2.Get only definnitions of the word.");
  print("3.History");
  print("4.Help");
  print("5.About me");
  stdout.write("Enter the number corresponding to your choice:");

  final number = stdin.readLineSync();
  if (number == '1') {
    print("Enter the word for full meaning:");
    final word = stdin.readLineSync();
    await meaning(word);
  } else if (number == '2') {
    final word = stdin.readLineSync();
    await definition(word);
  } else if (number == '3') {
    showHistory();
  } else if (number == '4') {
    await help();
  } else if (number == '5') {
    await aboutme();
  } else {
    print("Invalid choice. Please enter a number between 1 and 5.");
  }
}
