Simple configurable circular progress bar built out of the lines.

<p>
  <img src="https://github.com/G33kFreak/circular_progress_bar_with_lines/blob/main/doc/example.gif?raw=true"
    alt="An animated image of the iOS in-app purchase UI" height="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
</p>

## Getting started

## Installing

```yaml
dependencies:
  circular_progress_stack: ^0.0.1
```

### Import

```dart
import 'package:circular_progress_stack/circularprogressstack.dart';
```

## Example

```dart

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
                circleSize: MediaQuery.of(context).size.width - 200,
                strokeWidth: 15,
                strokeSpacePadding: 10,
                unporgressBarColor: const Color(0xffD7DEE7),
                barValues: [
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
                circleSize: MediaQuery.of(context).size.width - 300,
                strokeWidth: 10,
                strokeSpacePadding: 0,
                unPorgressBarWidth: -5,
                isAnimated: true,
                unProgressBarColor: const Color(0xffD7DEE7),
                animationDurationIn: const Duration(seconds: 1),
                barValues: [
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
}

```
