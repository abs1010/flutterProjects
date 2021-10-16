import 'package:flutter/material.dart';

void main() => runApp(BullsEyeApp());

class BullsEyeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BullsEye',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GamePage(title: 'BullsEye'),
    );
  }
}

class GamePage extends StatefulWidget {
  GamePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _alertIsVisible = false;
  bool _knockAlertIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to my first App!',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
            TextButton(
              child: Text('Hit Me!', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                this._alertIsVisible = true;
                _showAlert(context);
                print("Button pressed!");
              },
            ),
            TextButton(
              child: Text('Knock Knock!', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                this._knockAlertIsVisible = true;
                _showAlertWho(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    Widget okButton = TextButton(
        child: Text("Awesome"),
        onPressed: () {
          Navigator.of(context).pop();
          this._alertIsVisible = false;
          print("Awesome pressed! $_alertIsVisible");
        });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Hello There"),
          content: Text("This is my first po-up"),
          actions: <Widget>[
            okButton,
          ],
          elevation: 5,
        );
      },
    );
  }

  void _showAlertWho(BuildContext context) {
    Widget okButton = TextButton(
        child: Text("Owls say who"),
        onPressed: () {
          Navigator.of(context).pop();
          this._knockAlertIsVisible = false;
        });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Knock Knock?"),
          content: Text("Who is there?"),
          actions: <Widget>[
            okButton,
          ],
          elevation: 5,
        );
      },
    );
  }
}
