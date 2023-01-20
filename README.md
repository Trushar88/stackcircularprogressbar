# Stack Circular Progress

<p>
  <a href="https://pub.dev/packages/simple_circular_progress_bar/changelog">
    <img src="https://img.shields.io/badge/version-0.0.1-blueviolet" />
  </a>
  <a href="https://docs.flutter.dev/development/tools/sdk/releases">
    <img src="https://img.shields.io/badge/flutter-3.0.1-blue" />
  </a>
  <a href="https://dart.dev/guides/whats-new">
    <img src="https://img.shields.io/badge/dart-2.17.1-blue" />
  </a>
</p>

Make an animated multiple circular using Stack CircularProgress.

![Screenshot_1674193728](https://user-images.githubusercontent.com/95899209/213626508-56a87750-d37e-4d17-9992-35ec9923e457.png)


  &nbsp;&nbsp;&nbsp;&nbsp;

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
