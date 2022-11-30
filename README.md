# PaywallSDKSample

[![CI Status](https://img.shields.io/travis/serkanintranet/PaywallSDKSample.svg?style=flat)](https://travis-ci.org/serkanintranet/PaywallSDKSample)
[![Version](https://img.shields.io/cocoapods/v/PaywallSDKSample.svg?style=flat)](https://cocoapods.org/pods/PaywallSDKSample)
[![License](https://img.shields.io/cocoapods/l/PaywallSDKSample.svg?style=flat)](https://cocoapods.org/pods/PaywallSDKSample)
[![Platform](https://img.shields.io/cocoapods/p/PaywallSDKSample.svg?style=flat)](https://cocoapods.org/pods/PaywallSDKSample)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PaywallSDKSample is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PaywallSDKSample'
```

## Author

serkanintranet, serkan@intranettechnology.com

## License

PaywallSDKSample is available under the MIT license. See the LICENSE file for more info.

## Usage

Inherit 'Paywall Listener' to ViewController for detect your functions result. It will override 2 function which are called 'OnSuccess' and 'OnError'.

```ruby
class ViewController: UIViewController, PaywallListener

    func OnSuccess(type: Int, response: Data?) {
        print("On Success \(type) - \(response)")
    }
    
    func OnError(type: Int, message: String) {
        print("On Error \(type) - \(message)")
    }
```
