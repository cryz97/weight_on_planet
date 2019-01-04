import 'package:weight_on_planet/main.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return new HomeState();
  }

}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),

      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),

          children: <Widget>[
              new Image.asset("images/planet.png",
              height: 133,
              width: 200,),

            new Container(
              margin: const EdgeInsets.all(3),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[

                  new TextField(
                    controller: null,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Your weight on earth",
                        hintText: "in pounds",
                        icon: new Icon(Icons.person_outline)
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}