import 'package:flutter/material.dart';

class InputsView extends StatefulWidget {
  const InputsView({Key? key}) : super(key: key);

  @override
  _InputsState createState() => _InputsState();
}

class _InputsState extends State<InputsView> {
  late String _nombre = '';
  late String _email = '';
  late String _password = '';
  late String _fecha = '';
  String _opcionSeleccionada = 'volar';
  final List<String> _poderes = ['volar', 'Super fuerza', 'Rayos x'];

  final TextEditingController _textEditingControllerFacha =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs text'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          const Divider(),
          createInputEmail(),
          const Divider(),
          createInputPassword(),
          const Divider(),
          createInputFecha(context),
          const Divider(),
          _createInputDropDown(),
          const Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() => TextField(
        textCapitalization: TextCapitalization.sentences,
        autofocus: true,
        decoration: InputDecoration(
          counter: Text('Total ${_nombre.length}'),
          hintText: 'Jonathan Leiva Gómez',
          labelText: 'Nombres',
          helperText: 'Solo letras',
          suffixIcon: const Icon(Icons.accessibility),
          icon: const Icon(Icons.account_circle),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        onChanged: (value) {
          setState(() {
            _nombre = value;
          });
        },
      );

  Widget _crearPersona() => ListTile(
        title: Text('Nombre: $_nombre'),
        subtitle: Text('Email: $_email'),
        trailing: Text(_opcionSeleccionada),
      );

  Widget createInputEmail() => TextField(
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email',
          labelText: 'Email',
          helperText: 'Email',
          suffixIcon: const Icon(Icons.alternate_email),
          icon: const Icon(Icons.email),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        onChanged: (value) {
          setState(() {
            _email = value;
          });
        },
      );

  Widget createInputPassword() => TextField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        helperText: 'Contraseña',
        suffixIcon: const Icon(Icons.lock_outline),
        icon: const Icon(Icons.password),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (value) => setState(() => _password = value));

  Widget createInputFecha(BuildContext context) => TextField(
        autofocus: false,
        obscureText: false,
        controller: _textEditingControllerFacha,
        decoration: InputDecoration(
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimineto',
          helperText: 'Fecha de nacimiento',
          suffixIcon: const Icon(Icons.lock_outline),
          icon: const Icon(Icons.password),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _selectData(context);
        },
      );

  void _selectData(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2025),
        locale: const Locale('es', 'ES'));

    setState(() {
      _fecha = picked.toString();
      _textEditingControllerFacha.text = _fecha;
    });
  }

  List<DropdownMenuItem<String>> _getOptionDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    for (var poder in _poderes) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    }
    return lista;
  }

  Widget _createInputDropDown() => Row(
        children: [
          const Icon(Icons.select_all),
          const SizedBox(
            width: 30.0,
          ),
          Expanded(
            child: DropdownButton(
                value: _opcionSeleccionada,
                items: _getOptionDropdown(),
                onChanged: (value) {
                  setState(() => _opcionSeleccionada = value.toString());
                }),
          ),
        ],
      );
}
