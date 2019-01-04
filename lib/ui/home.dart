import 'package:weight_on_planet/main.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return new HomeState();
  }

}

class HomeState extends State<Home> {

  int radioValue = 0;
  final TextEditingController _weightController = new TextEditingController();
  double _finalResult = 0;
  
  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;

      switch(radioValue){
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);

      }


    });
  }

  double calculateWeight(String weight, double mult){
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0){
    return double.parse(weight) * mult;
    }else{
      print("wrong");
      return 0;
    }
  }

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
              margin: const EdgeInsets.all(2),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[

                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Your weight on earth",
                        hintText: "in pounds",
                        icon: new Icon(Icons.person_outline)
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5)),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),

                      new Text("Pluto",
                      style: new TextStyle(color: Colors.white30),),

                      new Radio<int>(
                        activeColor: Colors.redAccent,
                          value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),

                      new Text("Mart",
                        style: new TextStyle(color: Colors.white30),),

                      new Radio<int>(
                        activeColor: Colors.orangeAccent,
                          value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),

                      new Text("Venus",
                        style: new TextStyle(color: Colors.white30),),

                          
                    ],
                  ),

                  new Padding(padding: new EdgeInsets.all(15)),
                  
                  new Text(
                    "$_finalResult",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,

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