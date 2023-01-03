# PaywallSDK

[![CI Status](https://img.shields.io/travis/serkanintranet/PaywallSDKSample.svg?style=flat)](https://travis-ci.org/serkanintranet/PaywallSDKSample)
[![Version](https://img.shields.io/cocoapods/v/PaywallSDKSample.svg?style=flat)](https://cocoapods.org/pods/PaywallSDKSample)
[![License](https://img.shields.io/cocoapods/l/PaywallSDKSample.svg?style=flat)](https://cocoapods.org/pods/PaywallSDKSample)
[![Platform](https://img.shields.io/cocoapods/p/PaywallSDKSample.svg?style=flat)](https://cocoapods.org/pods/PaywallSDKSample)

## Gereksinimler

## Projeye Ekleme

Aşağıdaki kod satırını Podfile dosyanıza ekleyin

```ruby
pod 'PaywallSDKSample'
```

## Lisans

PaywallSDKSample is available under the MIT license. See the LICENSE file for more info.

## Kullanım

Import 'PaywallSDKSample'

```swift
import PaywallSDKSample
```

'Paywall Listener' protocolunu ViewController'unuza ekleyin. Başarılı veya başarısız sonuçları takip edebileceğiniz 2 fonksiyon ekleyecektir.

```swift
class ViewController: UIViewController, PaywallListener

    var builder: PaywallBuilder?

    override func viewDidLoad() {
        super.viewDidLoad()
        builder.delegate = self
    }
    func OnSuccess(type: Int, response: Data?) {
        print("On Success \(type) - \(response)")
    }
    
    func OnError(type: Int, message: String) {
        print("On Error \(type) - \(message)")
    }
```

Paywall SDK'i kullanabilmek için Paywall paneli üzerinden erişebileceğiniz (yoksa oluşturabilirsiniz) "publicapikey" ve "publicapiclient" parametrelerine ihtiyacınız var. Bunlarla birlikte aşağıdaki şekilde PaywallBuilder' ı ilklendirebilirsiniz.

```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let builder = PaywallBuilder()
        builder.setApiClient("[YOUR_API_CLIENT]")
        builder.setApiKey("[YOUR_API_KEY]")
        
    }

```

## Fonksiyonlar

Versiyon:
```swift
   builder.getVersion() // versiyon bilgisini alın
   
   //Response
   func OnSuccess(type: Int, response: Data?) {
        DispatchQueue.main.async {
            
            switch type {
            case RequestTypes().getRequestType(type: RequestTypesEnum.Version): // versiyon yanıtı
                do{
                    let responseData = try JSONDecoder().decode(PaywallSDKSample.VersionResponse.self, from: response!)
                    print("Version - \(responseData)")
                } catch let err {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        print(err)
                    }
                }
        }
    }
```
3D Ödeme başlat:

3D ödeme başlatmak için "Start3DPaymentRequestModel" modelini doldurmanız gerekmektedir. Bu model içerisinde "PaymentDetail" objesindeki "MerchantUniqueCode" parametresine her defasında unique bir kod vermelisiniz. Bu kod daha sonra ödeme bitirme işleminde kullanılacaktır. "MerchantSuccessBackUrl" parametresinde, 3D ödeme ekranında başarılı sonuç alındığı takdirde kullanıcının ilerlemesini istediğiniz sayfa ve aynı zamanda sizin takip edeceğiniz bir url eklemeniz gerekmektedir. 3D ödeme ekranında alınan başarılı sonucun ardından aşağıdaki "3D Ödeme sonlandırma" adımları izlenmelidir. "MerchantFailBackUrl" parametresinde, 3D ödeme ekranında başarısız sonuç alındığı takdirde kullanıcının ilerlemesini istediğiniz sayfa ve aynı zamanda sizin takip edeceğiniz bir url eklemeniz gerekmektedir.

```swift
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

```swift
   builder.start3D(start3DPaymentRequestModel: <#T##Start3DPaymentRequestModel#>)() // 3D ödeme başlat
   
   //Response
   func OnSuccess(type: Int, response: Data?) {
        DispatchQueue.main.async {
            
            switch type {
            case RequestTypes().getRequestType(type: RequestTypesEnum.Start3D): // 3D ödeme yanıtı
                do{
                    let responseData = try JSONDecoder().decode(PaywallSDKSample.Start3DResponse.self, from: response!) 
                    print("Start3D - \(responseData)")
                    
                    responseData.Body?.RedirectUrl!! // 'RedirectUrl' parametresiyle 3D ödeme ekranına ilerleyebilirsiniz.
                    
                } catch let err {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        print(err)
                    }
                }
        }
    }
```

3D Ödeme sonlandırma:

3D Ödeme ekranından aldığınız başarılı yanıtın ardından 3D Ödeme metodunu çağırmalısınız. Bu metodunun yanıtında alacağınız başarısız veya başarılı bilgisi ödeme işleminin aynı zamanda sonucu olacaktır.

3D Ödeme sonlandırmak için "EndPaymentRequestModel" modelini doldurmanız gerekmektedir. Bu modeldeki "MerchantUniqueCode", ödeme başlatırken kullandığınız kullandığınız "MerchantUniqueCode" parametresiyle aynı olmalıdır.


```swift
public struct EndPaymentRequestModel: Decodable {
    public var MerchantUniqueCode: String?
    public init(MerchantUniqueCode: String? = nil) {
        self.MerchantUniqueCode = MerchantUniqueCode
    }
}
```
```swift
builder?.end3D(endPaymentRequestModel: <#T##EndPaymentRequestModel#>) // Ödeme sonlandırma

//Response
   func OnSuccess(type: Int, response: Data?) {
        DispatchQueue.main.async {
            
            switch type {
            case RequestTypes().getRequestType(type: RequestTypesEnum.End3D): // Ödeme sonlandırma yanıtı
                do{
                    let responseData = try JSONDecoder().decode(PaywallSDKSample.End3DResponse.self, from: response!) 
                    
                } catch let err {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        print(err)
                    }
                }
        }
    }
```

İstek Çeşitleri:

```swift
public enum RequestTypesEnum {
    case Version
    case Start3D
    case End3D
}
```
