import 'package:flutter/material.dart';

class AlertView extends StatelessWidget {
  const AlertView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Alert'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Mostrar alerta'),
            style: ElevatedButton.styleFrom(
                primary: Colors.blue, shape: const StadiumBorder()),
            onPressed: () => _mostrarAlerta(context),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      );

  void _mostrarAlerta(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
            title: const Text('dialog'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Este es el contenido de la caja de alerta"),
                ),
                FlutterLogo(size: 100.0)
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar')),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('ok'))
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
          ));
}
