import 'package:flutter/material.dart';
class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    var imageName = index < 3 ?
    'images/accom/a${index + 1}.jpg' : 'images/accom/a${index + 1}.jpg';
    final  images =  [
      AssetImage('images/accom/a1.jpg'),
      AssetImage('images/accom/a4.jpg'),
      AssetImage('images/accom/a6.jpg'),
      AssetImage('images/accom/a8.jpg'),
    ];
    var iNamez;
    if (index < 3) {
      iNamez = images[index];
    }
    return new ListView.builder(
        itemCount: 4,
        itemBuilder: (context ,i)=>
        new Column(
          children: <Widget>[
            new Material(
                child: new Image.asset(imageName)
            ),
            new Material(
              child: new  Text("Alpha bedroom."),
            )
          ],
        )
    );
  }


}