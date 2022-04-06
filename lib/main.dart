import 'package:flutter/material.dart';
import 'package:untitled1/style1.dart';
import 'package:untitled1/style2.dart';
import 'package:untitled1/style3.dart';
import 'package:untitled1/style4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
    title: 'Flutter Demo',
    home: MyHomePage(),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('On Boarding'),
    ),
    body: Center(
      child: Column(
        children: [
          MyButton(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Style1()
                  ));
            },
            text: 'Style 1',
          ),
          MyButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Style2()
                ));
          }, text: 'Style 2',),
          MyButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Style3()
                ));
          }, text: 'Style 3',),
          MyButton(
            onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Style4()
                ));
          }, text: 'Style 4',),
        ],
      ),
    ),
  );
}

class MyButton extends StatelessWidget {

  String? text;
  VoidCallback? onPressed;
  Color? color;

  MyButton({
    Key? key,
    this.text,
    this.onPressed,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(text!),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
      ),
    );
  }
}


