import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome to Flutter', home: Comp1());
  }
}

class Comp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: const Text('ThisIsPhillip'),
        ),
        body: Inputwidget()));
  }
}

class Inputwidget extends StatefulWidget {
  const Inputwidget({Key? key}) : super(key: key);

  @override
  _InputwidgetState createState() => _InputwidgetState();
}

class _InputwidgetState extends State<Inputwidget> {
  final controller = TextEditingController();
  String text = "";
  int i = 2;
  String item1 = "qweq";
  List<String> item2 = ["sqeq", "sqeqwe"];
  String item3 = "qweqw";
  List<String> textlists = [" ", " ", " ", " "];

  clicky() {
    setState(() {
      this.text = controller.text;
      textlists.add(text);
      controller.clear();
      i++;

      if (i >= 9) {
        i = 3;
      }
    });
  }

  clear() {
    setState(() {
      print(textlists.last);
      textlists.clear();
      textlists.add("Add new Things");
      controller.clear();

      print(i);
    });
  }

  cleary(Index) {
    setState(() {
      textlists.removeAt(Index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.arrow_back),
              labelText: this.text,
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => clicky(),
              ))),
      IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        onPressed: () => clear(),
      ),
      IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        onPressed: () => textlists.length = 1,
      ),
      new Expanded(
          child: new ListView.builder(
              itemCount: textlists.length,
              itemBuilder: (BuildContext ctxt, int Index) {
                return new Center(
                    child: Row(children: [
                  Text("Nr ${Index + 1}  " + textlists[Index]),
                  IconButton(
                      onPressed: () => {cleary(Index)},
                      icon: Icon(Icons.ac_unit))
                ]));
              }))
    ]);
  }
}
