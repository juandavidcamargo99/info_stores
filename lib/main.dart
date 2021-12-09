import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'persistence/store_dao.dart';
import 'view/home_view.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  StoreDAO.addStoresFromServer().then((value){
    runApp(HomeView());
  });
}