import 'package:flutter/material.dart';
import 'persistence/store_dao.dart';
import 'view/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  StoreDAO.addStoresFromServer().then((value){
    runApp(HomeView());
  });
}