import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter calculator Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Basic calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String text = '';
  String operand = '';
  double num1 = 0.00;
  double num2 = 0.00;

  _appendText(String num){

    setState(() {

      bool isOperand = false;
      switch(num){

        case '+':
          num1 = double.parse(text);
          operand = '+';
          text = '';
          isOperand = true;
          break;

        case '-':
          num1 = double.parse(text);
          operand = '-';
          text = '';
          isOperand = true;
          break;

        case 'x':
          num1 = double.parse(text);
          operand = 'x';
          text = '';
          isOperand = true;
          break;

        case '/':
          num1 = double.parse(text);
          operand = '/';
          text = '';
          isOperand = true;
          break;

        case 'C':
          num1 = 0.0;
          num2 = 0.0;
          text = '';
          isOperand = true;
          break;

        case '=':
          num2 = double.parse(text);
          isOperand = true;

          switch(operand){

            case '+':
              text = '${num1 + num2}';
              break;

            case '-':
              text = '${num1 - num2}';
              break;

            case 'x':
              text = '${num1 * num2}';
              break;

            case '/':
              text = '${num1 / num2}';
              break;

          }
          
          break;

      }

      if(!isOperand)
      text += num;

    });

  }

  _makeButton(String txt){

    return Expanded(
        child: MaterialButton(
        child: Text(txt),
        padding: EdgeInsets.all(24.0),
        onPressed: () => _appendText(txt),
    )
    );

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[

            Expanded(child:
            Text(
              '$text',
              textScaleFactor: 2.5,
              textAlign: TextAlign.right,
              maxLines: 1,
            ),
            ),
            Expanded(child: Divider()),

            Expanded(child:
            Row(children: <Widget>[

              _makeButton(''),
              _makeButton('C'),
              _makeButton('='),
              _makeButton('/'),

            ],),),

            Expanded(child:
            Row(children: <Widget>[

              _makeButton('7'),
              _makeButton('8'),
              _makeButton('9'),
              _makeButton('x'),

            ],),),

            Expanded(child:
            Row(children: <Widget>[

              _makeButton('4'),
              _makeButton('5'),
              _makeButton('6'),
              _makeButton('-'),

            ],),),

            Expanded(child:
            Row(children: <Widget>[

              _makeButton('1'),
              _makeButton('2'),
              _makeButton('3'),
              _makeButton('+'),

            ],),),

          ],
        ),
      ),
    );
  }
}
