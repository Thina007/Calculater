import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calculater(),
    ));

class calculater extends StatefulWidget {
  const calculater({Key? key}) : super(key: key);

  @override
  _calculaterState createState() => _calculaterState();
}

class _calculaterState extends State<calculater> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculater'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 270,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  numbers("9"),
                  numbers("8"),
                  numbers("7"),
                  numbers("+")
                ],
              ),
              Row(
                children: [
                  numbers("6"),
                  numbers("5"),
                  numbers("4"),
                  numbers("-")
                ],
              ),
              Row(
                children: [
                  numbers("3"),
                  numbers("2"),
                  numbers("1"),
                  numbers("*")
                ],
              ),
              Row(
                children: [
                  numbers("C"),
                  numbers("0"),
                  numbers("="),
                  numbers("/")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget numbers(String num) {
    return Expanded(
      child: OutlineButton(
        onPressed: () {
          btnclicked(num);
        },
        child: Text(
          "$num",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            height: 3,
          ),
        ),
      ),
    );
  }

  String res = "", text = "";
  int first = 0, second = 0;

  String opp = '';
  void btnclicked(String val) {
    if (val == 'C') {
      res = '';
    } else if (val == '+' || val == '-' || val == '*' || val == '/') {
      first = int.parse(text);
      opp = val;
      res = '';
    } else if (val == '=') {
      n = 1;
      second = int.parse(text);
      if (opp == '+') {
        res = (first + second).toString();
      }
      if (opp == '-') {
        res = (first - second).toString();
      }
      if (opp == '*') {
        res = (first * second).toString();
      }
      if (opp == '/') {
        res = (first ~/ second).toString();
      }
    } else {
      res = text + val;
    }

    setState(() {
      text = res;
    });
  }
}
