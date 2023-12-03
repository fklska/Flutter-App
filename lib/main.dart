import 'package:flutter/material.dart';


import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(const App());
}

class App extends StatefulWidget{
const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App>{
  bool light = false;
  bool useMaterial3 = true;
  Color defaultMainColor = const Color.fromARGB(255, 255, 255, 255);
  Color mainColor = const Color.fromARGB(255, 255, 255, 255);
  bool pressed = false;
  double sliderValue = 0;

  String jokes = 'Здесь будут шутки';

  void changeLight(bool value)
  {
    setState(() {
      light = value;
    });
  }

  void changeMaterial(bool value)
  {
    setState(() {
      useMaterial3 = value;
    });
  }

  void setBorderRadius(double value)
  {
    setState(() {
      sliderValue = value;
    });
  }

  void jokeResponse() async
  { 
    var url = Uri.parse('https://official-joke-api.appspot.com/random_joke');
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

    setState(() {
      jokes = jsonResponse['setup'] + '\n' + jsonResponse['punchline'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: light ? Brightness.dark : Brightness.light,
        useMaterial3: useMaterial3,
        colorSchemeSeed: mainColor,
      ),
      home: Scaffold(
          appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.circular(sliderValue),
          ),
          width: 500,
          height: 700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(jokes, style:  const TextStyle(fontSize: 16),),
              IconButton(onPressed: jokeResponse, icon: const Icon(Icons.get_app, color: Colors.amber,)),
              Switch(value: light, onChanged: changeLight),
              Switch(value: useMaterial3, onChanged: changeMaterial),
              Slider(value: sliderValue, onChanged: setBorderRadius, min: 0, max: 100,)
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
