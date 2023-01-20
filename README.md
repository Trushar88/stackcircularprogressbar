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

## Screenshots
| Simple Cricular Porgress | Animated Cricular Porgress |
|---|---|
| <img src="https://user-images.githubusercontent.com/95899209/213628682-fa85ad7d-a0ef-48f5-94ba-5786e720d8dd.png" width="200"> | <img src="https://user-images.githubusercontent.com/95899209/213628480-935e79a5-357d-4196-9fb4-7ecdbcff07c1.gif" width="200"> |


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
  ```
  
### Animated Stack Circular Progress

```dart
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
  ```
## Support

If you find any bugs or issues while using the plugin, please register an issues on [GitHub](https://github.com/Trushar88/stackcircularprogressbar/issues). You can also contact us at <mistrytrushar88@gmail.com>.

## Author

This circular_progress_stack plugin for Flutter is developed by [Trushar Mistry](https://github.com/Trushar88).
