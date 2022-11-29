//
//  ViewController.swift
//  PaywallSDKSample
//
//  Created by serkanintranet on 11/17/2022.
//  Copyright (c) 2022 serkanintranet. All rights reserved.
//

import UIKit
import PaywallSDKSample

class ViewController: UIViewController, PaywallListener {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let builder = PaywallBuilder()
        builder.setApiClient("b367eaa5-2752-461d-b51b-f1a0e0d682e6")
        builder.setApiKey("OMVG3f7/eoYMb3TeEyDAyEvneIu1lKS9HOc0G2w5kxIGZBixw5jN0seN8DnMUYqy4Lxcu4vCMBC8h5ffJvFwB6FfP7ToSU4GoCb5WwJWJLns1+MOhQWWzENXpqwcCzScGQTnQ0KQ40Eh9LMpdNpBTgCkkLspmhdBggh6/9YEhyGwmesvpnsA11J8ukG31rUifokNTNw8dSzz6wc4//NtANzoaUBtxdRUmLgzpCxhHclBfwUJG/YHByvbphmPLwLDg6pGUe1yaFjaSCYkwwVgSdg4jo75EQuSu26gA8YZlugvyj6vLmBtpcXPmlEBXpl3DUcv77rgA7aei/lhw03Hhw==")
        builder.delegate = self
        
        let productModel = ProductModel(ProductId: "ProductId", ProductName: "ProductName", ProductCategory: "ProductCategory", ProductDescription: "ProductDescription", ProductAmount: Float(1))
        let productModel2 = ProductModel(ProductId: "ProductId", ProductName: "ProductName", ProductCategory: "ProductCategory", ProductDescription: "ProductDescription", ProductAmount: Float(1))
        
        var products: [ProductModel] = []
        products.append(productModel)
        products.append(productModel2)
        
        
        
        let start3DPaymentRequestModel = Start3DPaymentRequestModel(PaymentDetail: PaymentDetailModel(Amount: Float(1), MerchantUniqueCode: "54634573567356735", CurrencyId: 1, MerchantSuccessBackUrl: "https://www.google.com.tr", MerchantFailBackUrl: "https://www.google.com.tr", Installement: 1), Card: CardModel(OwnerName: "Enes Tütüncü", Number: "5218487962459752", ExpireMonth: "12", ExpireYear: "2026", Cvv: "000", UniqueCode: ""), Customer: CustomerModel(FullName: "FullName", Phone: "5336662211", Email: "enes@elekse.com", Country: "Country", City: "City", Address: "Address", IdentityNumber: "IdentityNumber", TaxNumber: "TaxNumber"), Products: products)
        
        let json = JSONSerializer.toJson(start3DPaymentRequestModel)
                
                print("JSON -> \(json)")
        
        builder.start3D(start3DPaymentRequestModel: start3DPaymentRequestModel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func OnSuccess(type: Int, response: Data?) {
        print("Here 3d On Success")
    }
    
    func OnError(type: Int, message: String) {
        print("Here 3d On Error \(message)")
    }
    
}

