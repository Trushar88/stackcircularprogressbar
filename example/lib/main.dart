import 'package:circular_progress_stack/circular_progress_stack.dart';
import 'package:example/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Stack Progress',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Circular Stack Progress'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedType = SIMPLE;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
              child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButtonFormField<String>(
                    value: _selectedType,
                    items: dropCircularTypeList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (c) {
                      setState(() {
                        _selectedType = c!;
                      });
                    },
                  )),
            ),
            Expanded(child: _changeOrder(_selectedType)),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _changeOrder(String value) {
    if (value == SIMPLE) {
      return _progressSimpleCircular();
    } else if (value == ANIMATED) {
      return _progressAnimatedCircular();
    } else {
      return _progressGardientAnimatedCircular();
    }
  }

  Widget _progressAnimatedCircular() {
    return Center(
      child: AnimatedStackCircularProgressBar(
        size: 200,
        progressStrokeWidth: 15,
        backStrokeWidth: 15,
        startAngle: 0,
        backColor: const Color(0xffD7DEE7),
        bars: [
          AnimatedBarValue(
            barColor: Colors.red,
            barValues: 70,
            fullProgressColors: Colors.red,
          ),
          AnimatedBarValue(
            barColor: Colors.green,
            barValues: 80,
            fullProgressColors: Colors.red,
          ),
          AnimatedBarValue(
            barColor: Colors.blue,
            barValues: 90,
            fullProgressColors: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _progressGardientAnimatedCircular() {
    return Center(
      child: GardientStackCircularProgressBar(
        size: 200,
        progressStrokeWidth: 15,
        backStrokeWidth: 15,
        startAngle: 0,
        mergeMode: true,
        maxValue: 100,
        backColor: const Color(0xffD7DEE7),
        bars: [
          GardientBarValue(
            barColores: [
              Colors.red,
              Colors.blue,
            ],
            barValues: 60,
            fullProgressColors: Colors.red,
          ),
          GardientBarValue(
            barColores: [
              Colors.blue,
              Colors.yellow,
            ],
            barValues: 70,
            fullProgressColors: Colors.yellow,
          ),
          GardientBarValue(
            barColores: [
              Colors.green,
              Colors.orange,
            ],
            barValues: 90,
            fullProgressColors: Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _progressSimpleCircular() {
    return Center(
      child: SimpleNewStackCircularProgressBar(
        size: 200,
        progressStrokeWidth: 15,
        backStrokeWidth: 15,
        startAngle: 0,
        backColor: const Color(0xffD7DEE7),
        bars: [
          SimpleNewBarValue(
            barColor: Colors.red,
            barValues: 60,
            fullProgressColors: Colors.red,
          ),
          SimpleNewBarValue(
            barColor: Colors.green,
            barValues: 70,
            fullProgressColors: Colors.red,
          ),
          SimpleNewBarValue(
            barColor: Colors.blue,
            barValues: 90,
            fullProgressColors: Colors.red,
          ),
        ],
      ),
    );
  }
}
