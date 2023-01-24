# Stack Circular Progress

<p align="center">
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


### Simple Stack Circular Progress

```dart
Center(
                child: SimpleNewStackCircularProgressBar(
                  size: 200,
                  progressStrokeWidth: 15,
                  backStrokeWidth: 15,
                  startAngle: 0,
                  backColor: const Color(0xffD7DEE7),
                  bars: [
                    SimpleNewBarValue(
                      barColor: Colors.red,
                      barValues: 50,
                      fullProgressColors: Colors.red,
                    ),
                    SimpleNewBarValue(
                      barColor: Colors.green,
                      barValues: 50,
                      fullProgressColors: Colors.red,
                    ),
                    SimpleNewBarValue(
                      barColor: Colors.blue,
                      barValues: 100,
                      fullProgressColors: Colors.red,
                    ),
                  ],
                ),
              ),
  ```
  
### Animated Stack Circular Progress

```dart
 Center(
                child: AnimatedStackCircularProgressBar(
                  size: 200,
                  progressStrokeWidth: 15,
                  backStrokeWidth: 15,
                  startAngle: 0,
                  backColor: const Color(0xffD7DEE7),
                  bars: [
                    AnimatedBarValue(
                      barColor: Colors.red,
                      barValues: 100,
                      fullProgressColors: Colors.red,
                    ),
                    AnimatedBarValue(
                      barColor: Colors.green,
                      barValues: 70,
                      fullProgressColors: Colors.red,
                    ),
                    AnimatedBarValue(
                      barColor: Colors.blue,
                      barValues: 70,
                      fullProgressColors: Colors.red,
                    ),
                  ],
                ),
              ),
  ```
  
  
### Gardient Animated Stack Circular Progress

```dart
 Center(
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
                      barValues: 70,
                      fullProgressColors: Colors.red,
                    ),
                    GardientBarValue(
                      barColores: [
                        Colors.blue,
                        Colors.yellow,
                      ],
                      barValues: 50,
                      fullProgressColors: Colors.yellow,
                    ),
                    GardientBarValue(
                      barColores: [
                        Colors.green,
                        Colors.orange,
                      ],
                      barValues: 70,
                      fullProgressColors: Colors.orange,
                    ),
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
