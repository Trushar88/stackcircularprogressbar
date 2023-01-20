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

Make an **Simple** or **Animated** multiple circular progress bar using **Stack Circular Progress**.

# Demo Simple And Animated 

<div>  
<img src= "https://user-images.githubusercontent.com/95899209/213628682-fa85ad7d-a0ef-48f5-94ba-5786e720d8dd.png" width="200"/>
<img src= "https://user-images.githubusercontent.com/95899209/213628480-935e79a5-357d-4196-9fb4-7ecdbcff07c1.gif" width="200"/>
</div>
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


### Stack Circular Progress

```dart
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
  ```
  
### Animated Stack Circular Progress

```dart
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
  ```
