import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'stores_view.dart';
import 'customer_form.dart';

class HomeView extends StatelessWidget {
  List<String> images = [
    "images/tiendas.png",
    "images/pedidos.png",
    "images/clientes.png",
    "images/buzon.png"
  ];

  @override
  void initState() {
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen(
        (message){
          if(message.notification != null){
            print(message.notification!.body);
            print(message.notification!.title);
          }
          print(message);
        },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(

          (messagge) {
        final routeMessagge = messagge.data["route"];
        print(routeMessagge);
        Navigator.of(context).pushNamed(routeMessagge);
      },

    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de nombres',
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Info Stores'), backgroundColor: Colors.cyan),
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
              ),
              itemBuilder: (context, index) => buildCell(context, index),
            )),
      ),
    );
  }

  Widget buildCell(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        _navigateTo(context, index);
      }, // handle your image tap here

      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Image.asset(
          images[index],
          fit: BoxFit.cover, // this is the solution for border
          width: 110.0,
          height: 110.0,
        ),
      ),
    );
  }

  _navigateTo(context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StoresListView()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CustomerFormView()),
      );
    }
    return;
  }
}
