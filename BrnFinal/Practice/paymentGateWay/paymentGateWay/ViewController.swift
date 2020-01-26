//
//  ViewController.swift
//  paymentGateWay
//
//  Created by Varalakshmi Kacherla on 1/21/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import Razorpay

class ViewController: UIViewController,RazorpayPaymentCompletionProtocol {
    func onPaymentError(_ code: Int32, description str: String) {
        
        print("Payment Failed")
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        
        print("Payment Successful")
    }
    
    
    
    var razorpay:Razorpay!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        razorpay = Razorpay.initWithKey("rzp_live_IY4KpjQSIMCcXf", andDelegate: self)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func payment(_ sender: Any) {
        
        showPaymentForm()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
    }
    
    
    
    internal func showPaymentForm(){
        let options: [String:Any] = [
                    "amount": "100", //This is in currency subunits. 100 = 100 paise= INR 1.
                    "currency": "INR",//We support more that 92 international currencies.
                    "description": "purchase description",
                    "order_id": "order_E2OQ2C0kSxWBgt",
                    "image": "https://url-to-image.png",
                    "name": "business or product name",
                    "prefill": [
                        "contact": "9797979797",
                        "email": "foo@bar.com"
                    ],
                    "theme": [
                        "color": "#F37254"
                    ]
                ]
        razorpay.open(options)
    }
    
}

