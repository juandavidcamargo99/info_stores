import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../persistence/server_connection.dart';

class CustomerFormView extends StatelessWidget {
  const CustomerFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Registro de clientes';

    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          automaticallyImplyLeading: true
        ),
        body: const MyCustomForm(),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.blue[500],
    minimumSize: Size(300, 15),
    padding: EdgeInsets.all(20.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  late String _nombre,_direccion,_telefono,_correo;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    const lblstyle=TextStyle(fontSize:15,color: Colors.green);
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text ('Nombre del Cliente',style:lblstyle),
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el nombre';
                }else{
                  setState(() {
                    this._nombre = value;
                  });
                  return null;
                }

              },
            ),
            const Text ('Dirección',style:lblstyle),
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese la dirección';
                }
                else{
                  setState(() {
                    this._direccion = value;
                  });
                  return null;
                }
              },
            ),
            const Text ('Teléfono',style:lblstyle),
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el teléfono';
                }
                else{
                  setState(() {
                    this._telefono = value;
                  });
                  return null;
                }
              },
            ),
            const Text ('Correo',style:lblstyle,),
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el correo';
                }
                else{
                  setState(() {
                    this._correo = value;
                  });
                  return null;
                }
              },
            ),
            Container(
              alignment: Alignment.center,
              padding : EdgeInsets.symmetric(vertical: 25),
              child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    var srvcon=ServerConnection();
                    srvcon.insert('Customer', this._nombre+';'+this._direccion+';'+this._telefono+';'+this._correo).then ((value){

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Datos insertados en el servidor')),
                      );
                    });
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.

                  }
                },
                child: const Text('Enviar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}