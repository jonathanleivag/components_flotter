import 'package:flutter/material.dart';

class AvatarView extends StatelessWidget {
  const AvatarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar'),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://media-exp1.licdn.com/dms/image/C4E03AQGExqL_RFiWLw/profile-displayphoto-shrink_200_200/0/1624162198837?e=1643241600&v=beta&t=Rjw7RaiWv_-JrlDL9SpX6dnopBmvVVUmOtOggymlTiM'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              child: Text('JL'),
            ),
          )
        ],
      ),
      body: const Center(
        child: FadeInImage(
            fadeInDuration: Duration(milliseconds: 200),
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://media-exp1.licdn.com/dms/image/C4E03AQGExqL_RFiWLw/profile-displayphoto-shrink_200_200/0/1624162198837?e=1643241600&v=beta&t=Rjw7RaiWv_-JrlDL9SpX6dnopBmvVVUmOtOggymlTiM')),
      ),
    );
  }
}
