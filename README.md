# Stack Circular Progress

<p>
 
  <a href="https://dart.dev/guides/whats-new">
  </a>
    <a href="https://pub.dev/packages/circular_progress_stack"><img src="https://img.shields.io/pub/likes/circular_progress_stack?logo=dart"/></a>
    <a href="https://pub.dev/packages/circular_progress_stack"><img src="https://img.shields.io/pub/popularity/circular_progress_stack?logo=dart"/></a>
    <a href="https://pub.dev/packages/circular_progress_stack"><img src="https://img.shields.io/pub/points/circular_progress_stack?logo=dart"/></a><br/>
    <img src="https://img.shields.io/badge/Platform-iOS%20%7C%20Android-blue?logo=flutter" alt="Platform" />
    <a href="https://pub.dev/packages/circular_progress_stack"><img src="https://img.shields.io/pub/v/circular_progress_stack"/></a>
  <img src="https://img.shields.io/github/license/Trushar88/stackcircularprogressbar?color=green"
      alt="License: MIT" />
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
## Support

If you find any bugs or issues while using the plugin, please register an issues on [GitHub](https://github.com/Trushar88/stackcircularprogressbar/issues). You can also contact us at <mistrytrushar88@gmail.com>.

## Want to contribute

If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature), feel free to send your [pull request](https://github.com/Trushar88/stackcircularprogressbar/pulls).

## Author

This circular_progress_stack plugin for Flutter is developed by [Trushar Mistry](https://github.com/Trushar88).
