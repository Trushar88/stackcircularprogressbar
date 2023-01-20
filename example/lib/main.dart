import 'package:circular_progress_stack/circularprogressstack.dart';
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
            Center(
              child: StackCircularProgress(
                //CircleSize set size according your UI
                circleSize: MediaQuery.of(context).size.width - 200,
                //StrokeWidth you can define value as per your need
                strokeWidth: 15,
                //strokeSpacePadding you can define value as per your need
                strokeSpacePadding: 10,
                //unporgressBarColor : set the color empty area of progress bar
                unporgressBarColor: const Color(0xffD7DEE7),
                //bar values list you can change according your values
                barValues: [
                  // you can set bar percentage according you progress value
                  // you can use your own color (Colors.anyColor)
                  BarValue(
                      progressValueInPercentage: 50, barColor: BarColor.green),
                  BarValue(
                      progressValueInPercentage: 40, barColor: BarColor.red),
                  BarValue(
                      progressValueInPercentage: 30, barColor: BarColor.purple),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Restaurant Rating Data",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Rating",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        color: BarColor.green,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        ">4",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        color: BarColor.red,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        ">3",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        color: BarColor.purple,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "<3",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: AnimatedStackCircularProgress(
                //CircleSize set size according your UI
                circleSize: MediaQuery.of(context).size.width - 300,
                //StrokeWidth you can define value as per your need
                strokeWidth: 10,
                //strokeSpacePadding you can define value as per your need
                strokeSpacePadding: 0,
                //unPorgressBarWidth you can set negative or positive value both accroding your need
                unPorgressBarWidth: -5,
                //isAnimated is define progressbar will be animate or not hence, if you want disable animation set it false
                isAnimated: true,
                //unporgressBarColor : set the color empty area of progress bar
                unProgressBarColor: const Color(0xffD7DEE7),
                //animationDurationIn you can set duration of animation
                animationDurationIn: const Duration(seconds: 1),
                //bar values list you can change according your values
                barValues: [
                  // you can set bar percentage according you progress value
                  // you can use your own color (Colors.anyColor)
                  BarValue(
                      progressValueInPercentage: 50, barColor: BarColor.blue),
                  BarValue(
                      progressValueInPercentage: 40, barColor: BarColor.red),
                  BarValue(
                      progressValueInPercentage: 30, barColor: BarColor.green),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
  }
}
