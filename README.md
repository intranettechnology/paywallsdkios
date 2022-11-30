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

Import 'PaywallSDKSample'

```ruby
import PaywallSDKSample
```

Inherit 'Paywall Listener' to ViewController for detect your functions result. It will override 2 function which are called 'OnSuccess' and 'OnError'.

```ruby
class ViewController: UIViewController, PaywallListener

    var builder: PaywallBuilder?

    override func viewDidLoad() {
        super.viewDidLoad()
                .
                .
        builder.delegate = self
                .
                .
        
    }
                .
                .
    func OnSuccess(type: Int, response: Data?) {
        print("On Success \(type) - \(response)")
    }
    
    func OnError(type: Int, message: String) {
        print("On Error \(type) - \(message)")
    }
                .
                .
```

To Initialize Paywall builder need to have apiclient and apikey. Than you can use all functions which PaywallSDK has.

```ruby
    override func viewDidLoad() {
        super.viewDidLoad()
                    .
                    .
        let builder = PaywallBuilder()
        builder.setApiClient("[YOUR_API_CLIENT]")
        builder.setApiKey("[YOUR_API_KEY]")
                    .
                    .
        
    }

```

## Functions

Version:
```ruby
   builder.getVersion() // get version information
   
   //Response
   func OnSuccess(type: Int, response: Data?) {
        DispatchQueue.main.async {
            
            switch type {
                    .
                    .
            case RequestTypes().getRequestType(type: RequestTypesEnum.Version): // get version response
                do{
                    let responseData = try JSONDecoder().decode(PaywallSDKSample.VersionResponse.self, from: response!) //Convert Data to VersionResponseModel
                    print("Version - \(responseData)")
                } catch let err {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        print(err)
                    }
                }
                    .
                    .
        }
    }
```
Start3DPayment:

First of all, you have to fill the "Start3DPaymentRequestModel" to start 3D Payment.

```ruby
public struct Start3DPaymentRequestModel: Decodable {
    public var PaymentDetail: PaymentDetailModel
    public var Card: CardModel
    public var Customer: CustomerModel
    public var Products: [ProductModel]
    
    public init(PaymentDetail: PaymentDetailModel = PaymentDetailModel(), Card: CardModel = CardModel(), Customer: CustomerModel = CustomerModel(), Products: [ProductModel] = [ProductModel()]) {
        self.PaymentDetail = PaymentDetail
        self.Card = Card
        self.Customer = Customer
        self.Products = Products
    }
}
```

```ruby
   builder.start3D(start3DPaymentRequestModel: [YOUR_MODEL])() // get version information
   
   //Response
   func OnSuccess(type: Int, response: Data?) {
        DispatchQueue.main.async {
            
            switch type {
                    .
                    .
            case RequestTypes().getRequestType(type: RequestTypesEnum.Start3D): // start3D response
                do{
                    let responseData = try JSONDecoder().decode(PaywallSDKSample.Start3DResponse.self, from: response!) //Convert Data to Start3DResponseModel
                    print("Start3D - \(responseData)")
                } catch let err {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        print(err)
                    }
                }
                    .
                    .
        }
    }
```
