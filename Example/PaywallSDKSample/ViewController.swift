//
//  ViewController.swift
//  PaywallSDKSample
//
//  Created by serkanintranet on 11/17/2022.
//  Copyright (c) 2022 serkanintranet. All rights reserved.
//

import UIKit
import PaywallSDKSample

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let builder = PaywallBuilder()
        builder.setApiClient("apikeyyy")
        builder.setApiKey("apicleentttt")
        
        builder.build()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

