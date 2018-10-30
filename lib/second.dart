import 'package:flutter/material.dart';
class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(3.0),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            children: _buildGridTiles(12),
          ),
        )
      ],
    );
    return new Scaffold(
        body: new Column(
          children: <Widget>[
            new Expanded(
                child: new Material(
                  child: grid,
                )
            )
          ],
        )


    );
  }
}
List<Widget> _buildGridTiles(numberOfTiles)
{
  List<Stack> containers = new List<Stack>.generate(numberOfTiles, (int index)
  {
    final imageName = index < 9 ?
    'images/drinks/d${index + 1}.jpg' : 'images/drinks/d${index + 1}.jpg';

    var foodName =[
      "Lemonade",
      "Pineapple",
      "Papaya",
      "Strawberry",
      "Crazy Coke",
      "Ice Cream",
      "Mango",
      "Avocado",
      "Chocolate",
      "Black Coffee",
      "Tea",
      "Soft Drinks"
    ];
    var foodNamez;
    if (index < 12) {
      foodNamez = foodName[index];
    }

    return new Stack(
      alignment: Alignment(0.0, 1.0),
      children: <Widget>[
        new Container (
          child: new Image.asset(imageName,
              width: 200.0,
              height: 200.0,
              fit: BoxFit.fill),
        ),
        new Container(
          padding: const EdgeInsets.all(2.0),
          decoration: new BoxDecoration(
              color: new Color.fromARGB(50, 71, 150, 236)
          ),
          child: new Text(foodNamez,style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87
          ),
          ),
        )
      ],
    );
  }
  );
  return containers;
}