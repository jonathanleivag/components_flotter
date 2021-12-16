import 'package:flutter/material.dart';

class ListViewsTemp extends StatefulWidget {
  const ListViewsTemp({Key? key}) : super(key: key);

  @override
  State<ListViewsTemp> createState() => _ListViewsState();
}

class _ListViewsState extends State<ListViewsTemp> {
  List<String> options = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List views')),
      body: ListView(
        children: _crearItems(),
      ),
    );
  }

  // forma Larga
  // List<Widget> _crearItems() {
  //   List<Widget> list = <Widget>[];

  //   for (String item in options) {
  //     final tempWidget = ListTile(
  //       title: Text(item),
  //     );
  //     list
  //       ..add(tempWidget)
  //       ..add(const Divider());
  //   }

  //   return list;
  // }

// forma corta

  List<Widget> _crearItems() => options
      .map((e) => Column(
            children: [
              ListTile(
                title: Text(e),
                subtitle: const Text('Subtitle'),
                leading: const Icon(Icons.access_alarms),
                trailing: const Icon(Icons.account_balance_wallet_outlined),
                onTap: () {},
              ),
              const Divider()
            ],
          ))
      .toList();
}
