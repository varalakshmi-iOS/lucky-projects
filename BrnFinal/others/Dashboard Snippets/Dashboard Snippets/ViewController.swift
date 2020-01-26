//
//  ViewController.swift
//  Dashboard Snippets
//
//  Created by GARLAPATI SAIRAM on 9/11/19.
//  Copyright © 2019 GARLAPATI SAIRAM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dashBoard.getValidatePulseLogin()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var dashBoard = UserDashboard()
    
    @IBOutlet weak var holidayDateTextView: UITextView!
    
    @IBOutlet weak var holidayReasonTextView: UITextView!
    
    @IBOutlet weak var leavesDateTextView: UITextView!
    
    @IBOutlet weak var leavesReasonTextView: UITextView!
    
    @IBOutlet weak var lateDateTextView: UITextView!
    
    
    @IBOutlet weak var checkInTextView: UITextView!
    
    
    @IBOutlet weak var presentDatesTextView: UITextView!
    
    
    @IBOutlet weak var spentTimeTextView: UITextView!
    
    
    //  Get Holidays btn
    @IBAction func holidayBtn(_ sender: Any) {
        
        dashBoard.getUserAttendance(textView: holidayDateTextView, UItextview: holidayReasonTextView, stringVar: "Holidays")
    }
    
    // Get Leaves Btn
    @IBAction func leavesBtn(_ sender: Any) {
        
        dashBoard.getUserAttendance(textView: leavesDateTextView, UItextview: leavesReasonTextView, stringVar: "Leaves")
    }
    
    // Get Late Details Btn
    @IBAction func lateDetailsBtn(_ sender: Any) {
        dashBoard.getUserAttendance(textView: lateDateTextView, UItextview: checkInTextView, stringVar: "Late")
    }
    
    // Get Working Hrs Btn
    @IBAction func spentTimeBtn(_ sender: Any) {
        dashBoard.getUserAttendance(textView: presentDatesTextView, UItextview: spentTimeTextView, stringVar: "Hours")
    }
}

