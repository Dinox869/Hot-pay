import 'package:flutter/material.dart';
class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    var imageName = index < 3 ?
    'images/accom/a${index + 1}.jpg' : 'images/accom/a${index + 1}.jpg';
    final  images =  [
      'images/accom/a1.jpg',
      'images/accom/a4.jpg',
      'images/accom/a6.jpg',
      'images/accom/a8.jpg',
    ];
    var iNamez;
    if (index < 3) {
      iNamez = images[index];
    }
    return new ListView.builder(
        itemCount: images.length,
        itemBuilder: (context ,i)=>
        new Column(
          children: <Widget>[
            new Material(
                child: new Image.asset(images[i])
            ),
            new Material(
              child: new  Text("Alpha bedroom."),
            )
          ],
        )
    );
  }


}