import 'package:hive_flutter/adapters.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  await Hive.openBox<List<String>>('string_list_box');
}

// Function to fetch the list of strings
List<String> fetchFavoritStickers() {
  final box = Hive.box<List<String>>('string_list_box');
  return box.get('myList', defaultValue: []) ?? [];
}

// Function to append a string to the list if it doesn't already exist
void appendFavorite(String newString) {
  final box = Hive.box<List<String>>('string_list_box');
  List<String> existingList = box.get('myList', defaultValue: []) ?? [];

  if (!existingList.contains(newString)) {
    existingList.add(newString);
    box.put('myList', existingList);
  }
}
