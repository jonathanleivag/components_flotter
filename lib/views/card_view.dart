import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card'),
      ),
      body: ListView(
        children: <Widget>[
          _cardType1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          const SizedBox(
            height: 30.0,
          ),
          _cardType1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          const SizedBox(
            height: 30.0,
          ),
          _cardType1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          const SizedBox(
            height: 30.0,
          ),
          _cardType1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          const SizedBox(
            height: 30.0,
          ),
          _cardType1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          const SizedBox(
            height: 30.0,
          ),
          _cardType1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          const SizedBox(
            height: 30.0,
          ),
          _cardType1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          const SizedBox(
            height: 30.0,
          ),
          _cardType1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          const SizedBox(
            height: 30.0,
          ),
        ],
        padding: const EdgeInsets.all(10.0),
      ),
    );
  }

  Widget _cardType1() => Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: <Widget>[
            const ListTile(
              title: Text('Soy el titulo de esta tarjeta'),
              subtitle: Text(
                  'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.'),
              leading: Icon(
                Icons.photo_album,
                color: Colors.blue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(onPressed: () {}, child: const Text('Cancelar')),
                TextButton(onPressed: () {}, child: const Text('Ok')),
              ],
            )
          ],
        ),
      );

  Widget _cardType2() {
    Column card = Column(
      children: <Widget>[
        const FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://pcpimpz.com/wp-content/uploads/2020/01/travel-landscape-01.jpg')),
        Container(
          child: const Text('No se que poner'),
          padding: const EdgeInsets.all(10.0),
        )
      ],
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
