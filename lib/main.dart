import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotpesa/receipts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:path/path.dart';
import './second.dart'as second;
import './third.dart'as third;
import 'package:hotpesa/view.dart';


void main() => runApp(MaterialApp(
    theme:
    ThemeData(primaryColor: Colors.lime , accentColor: Colors.limeAccent ),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: <String, WidgetBuilder> {
      "/a": (BuildContext context) => new Receipts("Receipts"),
      "/c": (BuildContext context) => new View("Food"),
    }
));

class SplashScreen extends StatefulWidget {
  @override
  AfterSplash createState() => new AfterSplash();
}
//SplashScreen.
class _SplashScreenState  extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();

    //   Timer(Duration(seconds: 3),()=> Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => AfterSplash()),
    //   ));

  }
  Widget build(BuildContext context)
  {
    return  Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.amber),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,

                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Hotel.ke",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("Online Hotels \n For Everyone",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              )

            ],
          )
        ],
      ) ,
    );

  }
}
//FirstPage
class AfterSplash extends State<SplashScreen> with SingleTickerProviderStateMixin  {
  TabController controller;
  @override
  void initState(){
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

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
            children: _buildGridTiles(19),
          ),
        )
      ],
    );
    Widget image_carousel = new Container(
      height: 150.0,
      child: new Carousel(
        boxFit: BoxFit.fitHeight,
        images: [
          AssetImage('images/elders/m1.jpg'),
          AssetImage('images/elders/m2.jpg'),
          AssetImage('images/elders/m3.jpg'),
          AssetImage('images/elders/m4.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),

    );
    return  Scaffold(
        appBar:  AppBar(
          title:  Text("Hot-pesa"),
          elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: (){showSearch(context: context, delegate: Datasearch()); } )
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.limeAccent,
          child: new TabBar(
            controller: controller,
            tabs: <Tab>[
              new Tab(icon: new Icon(Icons.local_dining)),
              new Tab(icon: new Icon(Icons.local_bar)),
              new Tab(icon: new Icon(Icons.hotel) ),
            ],
          ),
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: new Text("Dennis Ndegwa"),
                accountEmail: new Text("Jamesdennis@gmail.com"),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text("D"),
                ),
              ),
              new ListTile(
                title :  new Text ("Home"),
                leading: new Icon(Icons.home),
              ),
              new ListTile(
                  title :  new Text ("Receipts"),
                  leading: new Icon(Icons.receipt),
                  onTap:() {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/a");
                  }
              ),
              new ListTile(
                title :  new Text ("Profile"),
                leading: new Icon(Icons.person_outline),
              ),
              new Divider(),
              new ListTile(
                title :  new Text ("About."),
                leading: new Icon(Icons.help ,color: Colors.blue),
                onTap: ()=> Navigator.of(context).pop(),
              )
            ],
          ),
        ),
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new Column(
              children: <Widget>[
                Expanded(
                  child: new Material(
                    child: image_carousel,
                  ),
                ),
                new Material(
                  child: Text("Food Menu",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Expanded(
                  child: new Material(
                    child: grid,
                  ),
                )
              ],
            ),
            new second.Second(),
            new third.Third()
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
    'images/0${index + 1}.jpg' : 'images/${index + 1}.jpg';

    var foodName =[
      "French",
      "Lacasa",
      "S.A",
      "Garden ",
      "blueberry B",
      "pancakes-choc",
      "Beef chop",
      "Norm",
      "Pinky",
      "Biriani",
      "Kuku mix",
      "Salmon special",
      "Cat fish cream",
      "Choma chops",
      "American ribs",
      "Beef veg",
      "Salad special",
      "Green cut",
      "Lacuison",
    ];
    var foodNamez;
    if (index < 19) {
      foodNamez = foodName[index];
    }
    return new Stack(
      alignment: Alignment(0.0, 1.0),
      children: <Widget>[
        new Container (
          child: InkResponse(
            enableFeedback: true,
            child: new Image.asset(imageName,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.fill),
            onTap: () => {


            },
          ),
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
          ),)
          ,
        ),
      ],
    );
  }
  );
  return containers;
}
//to open a new page for
void _onTile(String index)
{


}
class Datasearch extends SearchDelegate<String>
{
  final hotels = [
    "Green Hills Hotel",
    "White Rhino Hotel",
    "Sarova Hotel",
    "Seven Seas Hotel",
    "Masaai Mara Hotel"
  ];
  final short = [
    "Green Hills Hotel",
    "White Rhino Hotel"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: (){
      query = "";
    })];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation), onPressed: (){
      close(context,null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    // actions to be done once tapped.Open a new hotel page but common
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionlist = query.isEmpty?short:hotels.where((p)=> p.startsWith(query)).toList();

    return ListView.builder(itemBuilder: (context,index)=>ListTile(
      onTap: ()
      {
        showResults(context);
      },
      leading: Icon(Icons.hotel),
      title: RichText(
        text: TextSpan(
            text: suggestionlist[index].substring(0,query.length),
            style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold
            ),
            children: [
              TextSpan(
                  text: suggestionlist[index].substring(query.length),
                  style: TextStyle(color: Colors.grey)
              )
            ]
        ),
      ),
    ),
      itemCount: suggestionlist.length,
    );
  }
}

