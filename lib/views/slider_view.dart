import 'package:flutter/material.dart';

class SliderView extends StatefulWidget {
  const SliderView({Key? key}) : super(key: key);

  @override
  _SliderViewState createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  double _valorSlider = 10.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('slider view'),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              _crearSlider(),
              crearCheck(),
              crearCheckTitle(),
              crearCheckSwitch(),
              Expanded(child: _crearImagen()),
            ],
          ),
        ));
  }

  Widget _crearSlider() => Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño de la imagen',
        value: _valorSlider,
        min: 10.0,
        max: 400.0,
        onChanged: !_bloquearCheck
            ? (value) => setState(() => _valorSlider = value)
            : null,
      );

  Widget _crearImagen() => FadeInImage(
      fadeInDuration: const Duration(milliseconds: 200),
      placeholder: const AssetImage('assets/jar-loading.gif'),
      width: _valorSlider,
      height: _valorSlider,
      fit: BoxFit.contain,
      image: const NetworkImage(
          'http://pa1.narvii.com/6100/83e560b1f5e43fd60016c08a204e0a5ebdc0ac80_00.gif'));

  Widget crearCheck() => Checkbox(
      value: _bloquearCheck,
      onChanged: (value) => setState(() => _bloquearCheck = value!));

  Widget crearCheckTitle() => CheckboxListTile(
      title: const Text('Bloquer slider'),
      value: _bloquearCheck,
      onChanged: (value) => setState(() => _bloquearCheck = value!));

  Widget crearCheckSwitch() => SwitchListTile(
      title: const Text('Bloquer slider'),
      value: _bloquearCheck,
      onChanged: (value) => setState(() => _bloquearCheck = value));
}
