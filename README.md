# HSCenterSlider

[![License](https://img.shields.io/cocoapods/l/HSCenterSlider.svg?style=flat)](http://cocoapods.org/pods/HSCenterSlider)
[![Platform](https://img.shields.io/cocoapods/p/HSCenterSlider.svg?style=flat)](http://cocoapods.org/pods/HSCenterSlider)

## Demo
![HSCenterSlider](https://github.com/hitendradeveloper/HSCenterSlider/blob/master/HSCenterSlider%20-%20Verticle%20Demo%202.gif)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
| Swift  | XCode | Tag/Pod version |
| --- | ------------- | ------ |
| 3.x  | >= 8.x  | 2.0.1 |
| 4.x  | >= 9.x  | 2.0.1 |
| 5.x  | >= 10.x | 2.0.1 |

## Installation

HSCenterSlider is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HSCenterSlider'
```

## How to use?
1. Drag the UIView and drop in to the storybaord or XIB
2. Give class HSHorizontalCenterSlider or HSVerticleCenterSlider to the view. That's it.
3. You center slider is ready to use in just two steps
   
## More Usage
- Change slider range between any two values, Default range is (-100,100)
```Swift
  slider.rangeValue = HSRange(low: -200, high: 100)
```

- Get value changes call back during user interaction using delegate method declared in the protocol HSCenterSliderDelegate
```Swift
  func centerSlider(slider: HSCenterSlider, didChange value: Double)
```

- Change the tint color of prograss view like a native UISlider
```Swift
  slider.tintColor = UIColor.black
```




##### Possible Error:
`[!] Unable to find a specification for 'HSCenterSlider'` 
##### Solution:

```ruby
pod setup
```

<br /><br />

## Author
#### Hitendra Solanki, [hitendra.developer@gmail.com](mailto://hitendra.developer@gmail.com)

#### Find my repositories on [Github](https://github.com/hitendradeveloper)
#### Read my blogs on [Medium](https://medium.com/@hitendrahckr)
#### Connect me via [LinkedIn](http://in.linkedin.com/in/hitendradeveloper)
#### Follow me on [Twitter](https://twitter.com/hitendrahckr)

<br /><br /><br />

## License

HSCenterSlider is available under the MIT license. See the LICENSE file for more info.
