# HSRange

[![CI Status](http://img.shields.io/travis/hitendradeveloper/HSRange.svg?style=flat)](https://travis-ci.org/hitendradeveloper/HSRange)
[![Version](https://img.shields.io/cocoapods/v/HSRange.svg?style=flat)](http://cocoapods.org/pods/HSRange)
[![License](https://img.shields.io/cocoapods/l/HSRange.svg?style=flat)](http://cocoapods.org/pods/HSRange)
[![Platform](https://img.shields.io/cocoapods/p/HSRange.svg?style=flat)](http://cocoapods.org/pods/HSRange)

## Demo
![HSRange](https://github.com/hitendradeveloper/HSRange/blob/master/HSRangeDemo.gif)

## Example Project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
| Swift  | XCode | Tag/Pod version |
| --- | ------------- | ------ |
| 3.x  | >= 8.x  | 1.1 |
| 4.0 - 4.1  | >= 9.x  | 1.1 |
| 4.2 - 4.3  | >= 10.0.x to <= 10.1.x  | 4.2 |
| 5.0 | >= 10.2  | 5.0 |


## How to use?
1. Create object of HSRangeConverter by passing two object of HSRange
   - Object of first range (A,B)
   - Object of second range (P,Q)
2. Convert your value from one range to other range.

```Swift
let firstRange = HSRange(low: 10, high: 80)
let secondRange = HSRange(low: 0.5, high: 0.9)

//Step1:
let rangeConverter = HSRangeConverter(range1: firstRange, range2: secondRange)  
        
//Step2:        
let valueInFirstRange = rangeConverter.toRange2(of: 45) //this will give 0.7
let valueInSecondRange = rangeConverter.toRange1(of: 0.9) //this will give 80
```

## Installation

HSRange is available through [CocoaPods](http://cocoapods.org). To install
it follow below steps. 

1. simply add the following line to your Podfile:

```ruby
pod 'HSRange'
```
2. Open terminal, change your current directory to project directory using `cd`.
3. Install pod.

```ruby
pod install
```
##### Possible Error:
`[!] Unable to find a specification for 'HSRange'` 
##### Solution:

```ruby
pod setup
```


## Author

Hitendra Solanki, hitendra.developer@gmail.com | twitter: @hitendrahckr

## License

HSRange is available under the MIT license. See the LICENSE file for more info.
