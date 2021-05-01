import 'package:flutter/material.dart';
import '../models/QuestionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // backgroundColor: Colors.grey.shade100,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(child: Quzzler()),
      ),
    );
  }
}

class Quzzler extends StatefulWidget {


  @override
  _QuzzlerState createState() => _QuzzlerState();
}

class _QuzzlerState extends State<Quzzler> {

  int _index = 0;
  List<Icon> icons = [];
  int playerScor  = 0;
  QuestionBank questionBank = new QuestionBank();

  void answer(bool ans , idx) {
      setState(() {
      
      if (_index == questionBank.quetion.length - 1) {
        Alert(context: context, title: "Game Over", desc: "The High scor is $playerScor.").show();
        icons = [];
        _index = 0;
        playerScor = 0;

      } else {
        if(questionBank.quetion[idx].answer == ans) {
          playerScor += questionBank.quetion[idx].scor;
          icons.add(Icon(Icons.check ,color: Colors.green));
        } else {
          icons.add(Icon(Icons.close ,color: Colors.red));
        }
        _index += 1;
      }
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                questionBank.quetion[_index].quetion.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'True',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                answer(true , _index);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                answer(false , _index);
              },
            ),
          ),
        ),
      Row(
        children: icons,
      )
      ],
    );
  }
}
