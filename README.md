# Stack Circular Progress

<p align="center">
 <a href="https://pub.dev/packages/circular_progress_stack"><img src="https://img.shields.io/pub/likes/circular_progress_stack?logo=dart"/></a>
    <a href="https://pub.dev/packages/circular_progress_stack"><img src="https://img.shields.io/pub/popularity/circular_progress_stack?logo=dart"/></a>
    <a href="https://pub.dev/packages/circular_progress_stack"><img src="https://img.shields.io/pub/points/circular_progress_stack?logo=dart"/></a><br/>
  <img src="https://img.shields.io/badge/Platform-iOS%20%7C%20Android-blue?logo=flutter" alt="Platform" />
  <a href="https://pub.dev/packages/circular_progress_stack"><img src="https://img.shields.io/pub/v/circular_progress_stack"/></a>
  <img src="https://img.shields.io/github/license/Trushar88/stackcircularprogressbar?color=green"
      alt="License: MIT" />
</p>

Make an **Simple** or **Animated** multiple and single circular progress bar using **Stack Circular Progress**.

## Screenshots
### Stack Circular

| Simple Cricular Porgress | Animated Cricular Porgress | Gradient Cricular Porgress |
|---|---|---|
| <img src="https://user-images.githubusercontent.com/95899209/214249833-1ac57e38-9d1c-49f9-999a-98ea27c329f4.png" width="200"> | <img src="https://user-images.githubusercontent.com/95899209/214249982-38999a53-8b31-4d1c-86d4-17580b37b5e8.gif" width="200"> | <img src="https://user-images.githubusercontent.com/95899209/214250330-d3d8df3c-4f02-4998-8675-16e20ce541f1.gif" width="200"> |

 &nbsp;
 
### Single Circular

| Simple Cricular Porgress | Animated Cricular Porgress | Gradient Cricular Porgress |
|---|---|---|
| <img src="https://user-images.githubusercontent.com/95899209/215424314-40de8676-2898-48c7-b9fe-be27b088ecd6.png" width="200"> | <img src="https://user-images.githubusercontent.com/95899209/215424943-93716654-f565-4804-a5a4-dc671efd81ff.gif" width="200"> | <img src="https://user-images.githubusercontent.com/95899209/215425629-c73cc8f9-9a5a-4b4d-b226-4426ef906f57.gif" width="200"> |

  &nbsp;&nbsp;&nbsp;&nbsp;

## Getting started

## Installing

```yaml
dependencies:
  circular_progress_stack: ^0.0.3
```

### Import

```dart
import 'package:circular_progress_stack/circularprogressstack.dart';
```


## Example 

### Stack Circular
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

### Single Circular
### Simple Stack Circular Progress

```dart
Center(
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
  ```
  
### Animated Stack Circular Progress

```dart
 Center(
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
  ```
  
  
### Gardient Animated Stack Circular Progress

```dart
Center(
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
  ```
  
  
## Support

If you find any bugs or issues while using the plugin, please register an issues on [GitHub](https://github.com/Trushar88/stackcircularprogressbar/issues). You can also contact us at <mistrytrushar88@gmail.com>.

## Want to contribute

If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature), feel free to send your [pull request](https://github.com/Trushar88/stackcircularprogressbar/pulls).

## Author

This circular_progress_stack plugin for Flutter is developed by [Trushar Mistry](https://github.com/Trushar88).

## Buy Me A Coffee

<a href="https://www.buymeacoffee.com/trushar88" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
