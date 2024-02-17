import 'dart:io';
import 'onlyDefinition.dart';

void main() async {
  stdout.write("Enter a word:");
  final word = stdin.readLineSync();

  await definition(word);
}
