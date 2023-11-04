import 'package:flutter/material.dart';

void main() => runApp(const simpledialog());

// ignore: camel_case_types
class simpledialog extends StatelessWidget {
  const simpledialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Recuperar el valor d''un camp de text',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm>{
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar el valor d\'un camp de text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(        
        backgroundColor: Colors.pinkAccent,
        hoverColor: Colors.pink,
        onPressed: () {
          showDialog(
            context: context, 
            barrierDismissible: true,
            builder: (BuildContext context){
              return SimpleDialog(
                title: const Text('L\'usuari ha entrat el missatge: '),
                children: [
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(myController.text),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Mostra el valor!',
        child: const Text('Veure'),
      ),
    );
  }
}