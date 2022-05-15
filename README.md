# DYWave

[![CI Status](https://img.shields.io/travis/ekdus0227@gmail.com/DYWave.svg?style=flat)](https://travis-ci.org/ekdus0227@gmail.com/DYWave)
[![Version](https://img.shields.io/cocoapods/v/DYWave.svg?style=flat)](https://cocoapods.org/pods/DYWave)
[![License](https://img.shields.io/cocoapods/l/DYWave.svg?style=flat)](https://cocoapods.org/pods/DYWave)
[![Platform](https://img.shields.io/cocoapods/p/DYWave.svg?style=flat)](https://cocoapods.org/pods/DYWave)

## At a Glance
Initialize WaveView with customizable parameters.
* Paramters 
  * frame : the size and position to draw
  * bgColor : background color of WaveView
  * maxTime : the time until the wave is reaching the bottom side
  * zeroYPoint : y offset to start to draw
```
let waveView = WaveView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height
            ),
            bgColor: .purple,
            maxTime: 30,
            zeroYPoint: 0
        )
```

## Tips
* You can start or pause the WaveView.
```
waveView.shouldStop = true
```
* You can reset the WaveView. If you set the backgroundColor paremeter, The background color of WaveView will be changed.
```
waveView.resetComponents(backgroundColor: nil)
```

## Example
![화면-기록-2022-05-15-오후-11 09 41](https://user-images.githubusercontent.com/41604600/168477125-4d94775a-4324-4caf-8333-eb613d8893b7.gif)


## Installation

DYWave is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DYWave'
```

## Author

ekdus0227@gmail.com

## License

DYWave is available under the MIT license. See the LICENSE file for more info.
