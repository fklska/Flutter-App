import 'package:flutter/material.dart';

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
  Color defaultMainColor = const Color.fromARGB(255, 18, 212, 44);
  Color mainColor = const Color.fromARGB(255, 255, 255, 255);
  bool pressed = false;
  double sliderValue = 0;

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

  void setMainColorRed()
  {
    setState(() {
      pressed = !pressed;
      mainColor = pressed ? Colors.red : defaultMainColor;
    });
  }

  void setBorderRadius(double value)
  {
    setState(() {
      sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: light ? Brightness.dark : Brightness.light,
        useMaterial3: useMaterial3,
        colorSchemeSeed: mainColor
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          backgroundColor: Theme.of(context).focusColor,
        ),
        body: Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.circular(sliderValue)
          ),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
              onPressed: setMainColorRed,
                icon: const Icon(Icons.circle_outlined, color: Colors.red,),
                isSelected: pressed,
                selectedIcon: const Icon(Icons.circle_rounded, color: Colors.red,),
                ),
              Switch(value: light, onChanged: changeLight),
              Switch(value: useMaterial3, onChanged: changeMaterial),
              Slider(value: sliderValue, onChanged: setBorderRadius, min: 0, max: 100,)
            ],
          ),
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
