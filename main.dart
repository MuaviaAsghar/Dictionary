import 'dart:io';
import 'definition.dart';

void main() async {
  stdout.write("Enter a word:");
  final word = stdin.readLineSync();

  await definition(word);
}
