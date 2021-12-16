import 'package:components_flotter/providers/menu_provider.dart';
import 'package:components_flotter/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class ListViewApp extends StatelessWidget {
  const ListViewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
      ),
      body: _listComponent(),
    );
  }

  Widget _listComponent() => FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: const [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) => ListView(
            children: _listItems(snapshot.data, context),
          ));

  List<Widget> _listItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];
    data?.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () => Navigator.pushNamed(context, element['ruta']),
      );
      opciones
        ..add(widgetTemp)
        ..add(const Divider());
    });
    return opciones;
  }
}
