import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ChangeTheme extends StatefulWidget{
  const ChangeTheme({super.key});

  @override
  State<StatefulWidget> createState() => _OnChangeTheme();
}

class _OnChangeTheme extends State<ChangeTheme>{
  ThemeMode themeMode = ThemeMode.system;
  bool light = true;

  void brightChange(bool value)
  {
    setState(() {
      light = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: light,
      onChanged: brightChange
    );
  }
}


class TutorialHome extends StatelessWidget{
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Example title'),
        backgroundColor: const Color.fromARGB(234, 34, 43, 1),
      ),
      backgroundColor: const Color.fromARGB(255, 32, 31, 31),
      body: const Center(child: ChangeTheme()),
    );
  }
}

void main(List<String> args) {
  runApp(
     MaterialApp(
      title: 'Fklska title',
      home: TutorialHome(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.light(),
      ),
  );
}