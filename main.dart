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
  print("1. Get full meaning of the word.");
  print("2. Get only definitions of the word.");
  print("3. History");
  print("4. About me");
  print("5. Help");

  print("");

  print(
      "Tip => If you want to rerun the program after one function type **run in terminal**");

  print("");
  print(
      "Tip => If you want to terminate the program after one function type **end in terminal**");
  print("");

  stdout.write("Enter the number corresponding to your choice:");
  print("");

  final number = stdin.readLineSync();

  if (number == '1') {
    print("");
    stdout.write("Enter the word for full meaning:");
    final word = stdin.readLineSync();
    showLoading();
    await Future.delayed(const Duration(seconds: 5));
    await meaning(word);
    await addToHistory(word);

    final rerun = stdin.readLineSync();
    if (rerun == 'run') {
      return main();
    } else if (rerun == 'end') {
      exit(0);
    }
  } else if (number == '2') {
    print("");
    stdout.write("Enter the word for full meaning:");
    final word = stdin.readLineSync();
    showLoading();
    await Future.delayed(const Duration(seconds: 5));
    await definition(word);
    await addToHistory(word);

    final rerun = stdin.readLineSync();
    if (rerun == 'run') {
      return main();
    } else if (rerun == 'end') {
      exit(0);
    }
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

    final rerun = stdin.readLineSync();
    if (rerun == 'run') {
      return main();
    } else if (rerun == 'end') {
      exit(0);
    }

    final delete = stdin.readLineSync();
    if (delete == "Clear") {
      deleteHistory();
    } else {
      print("You're good to go");
    }
  } else if (number == '4') {
    await about();

    final rerun = stdin.readLineSync();
    if (rerun == 'run') {
      return main();
    } else if (rerun == 'end') {
      exit(0);
    }
  } else if (number == '5') {
    await help();
    final rerun = stdin.readLineSync();

    if (rerun == 'run') {
      return main();
    } else if (rerun == 'end') {
      exit(0);
    }
  } else {
    print("Invalid choice. Please enter a number between 1 and 5.");

    final rerun = stdin.readLineSync();

    if (rerun == 'run') {
      return main();
    } else if (rerun == 'end') {
      exit(0);
    }
  }
}
