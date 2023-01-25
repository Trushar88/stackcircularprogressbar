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
      title: APPBARTITILE,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: APPBARTITILE),
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
    } else if (value == SINGLEANIMATED) {
      return _progressSingleAnimatedCircular();
    } else if (value == SINGLESIMPLE) {
      return _progressSingleSimpleCircular();
    } else if (value == SINGLEGRADIENT) {
      return _progressSingleGardientAnimatedCircular();
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
      child: GradientStackCircularProgressBar(
        size: 200,
        progressStrokeWidth: 15,
        backStrokeWidth: 15,
        startAngle: 0,
        mergeMode: true,
        maxValue: 100,
        backColor: const Color(0xffD7DEE7),
        bars: [
          GradientBarValue(
            barColores: [
              Colors.red,
              Colors.blue,
            ],
            barValues: 60,
            fullProgressColors: Colors.red,
          ),
          GradientBarValue(
            barColores: [
              Colors.blue,
              Colors.yellow,
            ],
            barValues: 70,
            fullProgressColors: Colors.yellow,
          ),
          GradientBarValue(
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
      child: SimpleStackCircularProgressBar(
        size: 200,
        progressStrokeWidth: 15,
        backStrokeWidth: 15,
        startAngle: 0,
        backColor: const Color(0xffD7DEE7),
        bars: [
          SimpleBarValue(
            barColor: Colors.red,
            barValues: 60,
            fullProgressColors: Colors.red,
          ),
          SimpleBarValue(
            barColor: Colors.green,
            barValues: 70,
            fullProgressColors: Colors.red,
          ),
          SimpleBarValue(
            barColor: Colors.blue,
            barValues: 90,
            fullProgressColors: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _progressSingleAnimatedCircular() {
    return const Center(
      child: SingleAnimatedStackCircularProgressBar(
        size: 200,
        progressStrokeWidth: 15,
        backStrokeWidth: 15,
        startAngle: 0,
        backColor: Color(0xffD7DEE7),
        barColor: Colors.blue,
        barValue: 70,
      ),
    );
  }

  Widget _progressSingleGardientAnimatedCircular() {
    return const Center(
      child: SingleGradientStackCircularProgressBar(
        size: 200,
        progressStrokeWidth: 15,
        backStrokeWidth: 15,
        startAngle: 0,
        mergeMode: true,
        maxValue: 100,
        backColor: Color(0xffD7DEE7),
        barColores: [Colors.red, Colors.blue, Colors.green],
        fullProgressColor: Colors.green,
        barValue: 99,
      ),
    );
  }

  Widget _progressSingleSimpleCircular() {
    return const Center(
      child: SingleSimpleStackCircularProgressBar(
        size: 200,
        progressStrokeWidth: 15,
        backStrokeWidth: 15,
        startAngle: 0,
        backColor: Color(0xffD7DEE7),
        barColor: Colors.red,
        barValue: 70,
      ),
    );
  }
}
