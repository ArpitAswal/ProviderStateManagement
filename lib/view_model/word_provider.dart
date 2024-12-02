import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';

class WordProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  var currentWord = WordPair.random();
  var favorites = <WordPair>[];

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  void getNext() {
    currentWord = WordPair.random();
    notifyListeners();
  }

  void removeFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
  }

  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? currentWord;
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }
}
