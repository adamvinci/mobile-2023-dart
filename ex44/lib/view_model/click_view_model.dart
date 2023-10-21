import 'dart:collection';

import 'package:ex44/models/article.dart';
import 'package:flutter/cupertino.dart';

class ClickViewModel extends ChangeNotifier {

  final List<Article> _articles = defaultArticles;
  bool afficherLu = false;
  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Article> get items {
    if(afficherLu){
      return UnmodifiableListView(_articles);
  }else{
      return UnmodifiableListView(_articles.where((article) => article.read == false));
    }
  }

  void changeAfficherLue(bool value){
    afficherLu = !value;

    notifyListeners();
  }
  void markAsRead(Article article){
    article.read = !  article.read;
  notifyListeners();
  }


  Article getOne(int id){
    return items[id];
  }

  void add(Article article) {
    _articles.add(article);
    notifyListeners();
  }

  /// Removes all items from the cart.
  void remove(Article article) {
    _articles.remove( article);
    notifyListeners();
  }
}