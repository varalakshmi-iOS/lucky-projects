//
//  ViewController.swift
//  segmentation
//
//  Created by Pechetti Gautami Priya on 9/25/19.
//  Copyright © 2019 Pechetti Gautami Priya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
   
    var componentType:UISegmentedControl!
    var componentAxis:UISegmentedControl!
    var modes:UISegmentedControl!
    var arr:[String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    var stepper:UIStepper!
    var slider:UISlider!
    var currentValue:UILabel!
    var scrollViewOffLine:UIScrollView!
    var onButton:UIButton!
    var get:UIButton!
    
    var URLReqObj:URLRequest!
    var dataTaskObj:URLSessionDataTask!
    
    var switch1Array = [UILabel]()
    var switch2Array = [UIButton]()
    var switch3Array = [UISwitch]()
    var scrollViewOnLine:UIScrollView!
    var stepperOnLine:UIStepper!
    
    var lbl:UILabel!
    var btn:UIButton!
    var switches:UISwitch!
    var value = 0
    var onlineData:[String:Any] = [:]
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
       
        onlineComponents()
      
        stepperOnLine.addTarget(self, action: #selector(stepperFn), for: UIControl.Event.valueChanged)
        get.addTarget(self, action: #selector(json), for: UIControl.Event.touchUpInside)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createUI(){
        
        modes = UISegmentedControl(items: ["OFFLINE", "ONLINE"])
        modes.frame = CGRect(x: 150, y: 250, width: 100, height: 40)
       modes.addTarget(self, action: #selector(segmentedControl(changeSegmentedControl:)), for: UIControl.Event.valueChanged)
        view.addSubview(modes)}
    
    func onlineComponents(){
    
        
        get=UIButton(type: UIButton.ButtonType.system)
        get.frame = CGRect(x: 100, y: 130, width: 200, height: 40)
        get.setTitle("GET", for: UIControl.State.normal)
        get.setTitleColor(UIColor.red, for: UIControl.State.normal)
        
        scrollViewOnLine = UIScrollView()
        scrollViewOnLine.frame = CGRect(x: 40, y: 450, width: 300, height: 300)
        scrollViewOnLine.contentSize=CGSize(width: 5000, height: 5000)
        //scrollView.tintColor=UIColor.cyan
        scrollViewOnLine.backgroundColor=UIColor.gray
        view.addSubview(scrollViewOnLine)
        
        stepperOnLine = UIStepper()
        stepperOnLine.frame = CGRect(x: 300, y: 800, width: 100, height: 100)
        stepperOnLine.minimumValue = 0
        stepperOnLine.maximumValue = 100
        stepperOnLine.tintColor = UIColor.red
        view.addSubview(stepperOnLine)
        
        
    }

    
    @objc func segmentedControl(changeSegmentedControl:UISegmentedControl){
        if (modes.selectedSegmentIndex == 0){
    
    componentType = UISegmentedControl(items: ["Label", "Button", "Switch"])
    componentType.frame = CGRect(x: 150, y:150, width: 150, height: 40)
    view.addSubview(componentType)
    
    
    componentAxis = UISegmentedControl(items: ["Horizontal", "Vertical"])
    componentAxis.frame = CGRect(x: 150, y:200, width: 100, height: 40)
    // componentAxis.apportionsSegmentWidthsByContent = true
    view.addSubview(componentAxis)
    
    
        
        stepper = UIStepper()
        stepper.frame = CGRect(x: 300, y: 800, width: 100, height: 100)
       stepper.addTarget(self, action: #selector(createStepper), for: UIControl.Event.valueChanged)
        stepper.minimumValue = 0
        stepper.maximumValue = 1000
        stepper.tintColor = UIColor.red
        view.addSubview(stepper)
        
      
        slider = UISlider()
        slider.frame = CGRect(x: 100, y: 340, width: 150, height: 50)
        slider.addTarget(self, action: #selector(createSlider), for: UIControl.Event.valueChanged)
        slider.minimumValue = 0
        slider.maximumValue = 1000
        slider.thumbTintColor = UIColor.blue
        slider.tintColor = UIColor.red
        view.addSubview(slider)
        
        currentValue = UILabel()
        currentValue.frame = CGRect(x: 300, y: 350, width: 50, height: 40)
        currentValue.tintColor=UIColor.green
        currentValue.backgroundColor=UIColor.green
        currentValue.textColor=UIColor.black
        currentValue.text="value"
        currentValue.textAlignment = .center
         view.addSubview(currentValue)
        
        scrollViewOffLine = UIScrollView()
        scrollViewOffLine.frame = CGRect(x: 40, y: 450, width: 300, height: 300)
        scrollViewOffLine.contentSize=CGSize(width: 5000, height: 5000)
       // scrollView.tintColor=UIColor.cyan
        scrollViewOffLine.backgroundColor=UIColor.cyan
        view.addSubview(scrollViewOffLine)

            
            
            
            
            
            onButton=UIButton(type: UIButton.ButtonType.system)
            onButton.frame=CGRect(x: 150, y:400, width: 100, height: 30)
            onButton.tintColor=UIColor.blue
            onButton.backgroundColor=UIColor.cyan
            onButton.setTitle("CREATE", for: UIControl.State.normal)
            onButton.addTarget(self, action: #selector(switchValues), for: UIControl.Event.touchUpInside)
             view.addSubview(onButton)

            
            
           get.removeFromSuperview()
            scrollViewOnLine.removeFromSuperview()
            stepperOnLine.removeFromSuperview()
            
        }
        
    
    if (modes.selectedSegmentIndex == 1)
    {
    slider.removeFromSuperview()
    currentValue.removeFromSuperview()
    stepper.removeFromSuperview()
    onButton.removeFromSuperview()
    componentType.removeFromSuperview()
    componentAxis.removeFromSuperview()
        view.addSubview(scrollViewOnLine)
        view.addSubview(stepperOnLine)
     view.addSubview(get)
    
    }else {
        
        view.addSubview(slider)
        }
        
    
    }
    
    @objc func createSlider(){
        
    var sliderval:String = String(Int(slider.value))
        
        currentValue.text = String(Int(slider.value))
        stepper.value = Double(slider.value)
            }
    
    
    @objc func createStepper() {
        var stepperVal:String = String(Int(stepper.value))
        currentValue.text = stepperVal
        slider.setValue(Float(stepper.value), animated: true)
        stepper.addTarget(self, action: #selector(switchValues), for: UIControl.Event.valueChanged)
        slider.value = Float(stepper.value)
        
       
        
    }
  
    func remove(){
        for val in switch1Array{
            val.removeFromSuperview()
        }
        for val in switch2Array{
            val.removeFromSuperview()
        }
        for val in switch3Array{
            val.removeFromSuperview()
        }
        
    }
   
                            // offline
    
    
    @objc func switchValues(){
        
        remove()

        var value1=Int(slider.value)
        if(componentType.selectedSegmentIndex==0 && componentAxis.selectedSegmentIndex==0)
            
        {
            var labelx:UInt16=10
            var labely:UInt16=25
            for i in 0...value1-1
            {
                if(labelx>400)
                    
                {
                    labelx=10
                    labely=labely+40
                }
                
                lbl=UILabel()
                
                lbl.frame=CGRect(x: Int(labelx), y: Int(labely), width: 40, height: 30)
                lbl.text="\(i)"
                lbl.backgroundColor=UIColor.gray
                lbl.textAlignment = .center
                lbl.textColor=UIColor.red
                labelx=labelx+50
                self.switch1Array.append(lbl)
                view.addSubview(lbl)
                scrollViewOffLine.addSubview(lbl)
                
            }
        }
        
        
        if(componentType.selectedSegmentIndex==1 && componentAxis.selectedSegmentIndex==0){
            var labelx:UInt16=10
            var labely:UInt16=25
            for i in 1...value1{
                
                if (labelx>400){
                    labelx = 10
                    labely = labely+40
                    
                }
                btn = UIButton()
                btn.frame=CGRect(x: Int(labelx), y: Int(labely), width: 30, height: 30)
                
                btn.backgroundColor=UIColor.gray
                labelx=labelx+50
                self.switch2Array.append(btn)
                view.addSubview(btn)
                scrollViewOffLine.addSubview(btn)
            }
        }
        
        if(componentType.selectedSegmentIndex==2 && componentAxis.selectedSegmentIndex==0){
            
            var labelx:UInt16=10
            var labely:UInt16=25
            for i in 1...value1{
                
                
                if (labelx>400){
                    
                    labelx = 10
                    labely = labely+40
                }
                switches=UISwitch()
                switches.frame=CGRect(x: Int(labelx), y: Int(labely), width: 30, height: 30)
                switches.backgroundColor=UIColor.gray
                labelx=labelx+60
                self.switch3Array.append(switches)
                scrollViewOffLine.addSubview(switches)
                
            }
        }
        
        if(componentType.selectedSegmentIndex==0 && componentAxis.selectedSegmentIndex==1)
            
        {
            var labelx:UInt16=10
            var labely:UInt16=40
            for i in 1...value1{
                if(labely>1000)
                    
                {
                    labelx=labelx+60
                    labely=40
                }
                
                lbl=UILabel()
                lbl.frame=CGRect(x: Int(labelx), y: Int(labely), width: 40, height: 30)
                lbl.text="\(i)"
                lbl.backgroundColor=UIColor.gray
                lbl.textAlignment = .center
                lbl.textColor=UIColor.red
                // labelx=1
                scrollViewOffLine.addSubview(lbl)
                self.switch1Array.append(lbl)
                labely+=50
                
            }
            
        }
        
        if (componentType.selectedSegmentIndex==1 && componentAxis.selectedSegmentIndex==1){
            
            var labelx:UInt16=40
            var labely:UInt16=10
            for i in 1...value1{
                
                if (labely>730){
                    labelx = labelx+40
                    labely = 10
                    
                }
                
                btn = UIButton()
                btn.frame=CGRect(x: Int(labelx), y: Int(labely), width: 40, height: 30)
                btn.backgroundColor=UIColor.gray
                labelx+=1
                self.switch2Array.append(btn)
                scrollViewOffLine.addSubview(btn)
                labely+=40
                
            }
        }
        
        if (componentType.selectedSegmentIndex==2 && componentAxis.selectedSegmentIndex==1){
            var labelx:UInt16=10
            var labely:UInt16=40
            for i in 1...value1{
                
                if (labely>1000)
                {
                    
                    labelx = labelx+60
                    labely = 40
                    
                }
                
                switches=UISwitch()
                switches.frame=CGRect(x: Int(labelx), y: Int(labely), width: 40, height: 30)
                switches.backgroundColor=UIColor.gray
                //labelx+=1
                self.switch3Array.append(switches)
                scrollViewOffLine.addSubview(switches)
                labely+=50
                
            }
        }
    }
    
  
    
        @objc func json()
        {
             remove()
            
             onlineData = getDetails()
            
            value = onlineData["quantity"] as! Int
            stepperOnLine.value = Double(value)
            
            print(value)
            components()
            // Creating labels in horizontal way
            
            // creating Horizontal labels
            
    }
            
            
            func components(){
            var xPos:UInt16 = 10
            var yPos:UInt16 = 20
            var j:Int = 0
            var k:Int = 0
            for i in 0...value{
                
                
                if(onlineData["axis"] as! String == "Horizontal"){
                    var rows:Int = onlineData["maxPerRow"] as! Int
                    var output = i - (rows * j)
                    if(rows == output){
                        j = j+1
                        xPos = 10
                        yPos = yPos+60
                        
                        
                    }
                    
                }
             
                
                // Creating labels in horizontal way
                
                if(onlineData["axis"] as! String == "Horizontal" && onlineData["component"] as! String == "Label"){
                    let horizontalLabel = UILabel()
                    horizontalLabel.frame = CGRect(x: Int(xPos), y: Int(yPos), width: 30, height: 30)
                    if(onlineData["displayNumbers"] as! Int == 1){
                        let arrvalue = i - arr.count * k
                        var key = arrvalue
                        if(arrvalue==25){
                            k = k+1
                        }
                        
                        horizontalLabel.text = "\(arr[key])"
                        
                        print("\(arr[key])")
                        
                        
                    }
                    
                    if(onlineData["displayNumbers"] as! Int == 0){
                        
                        horizontalLabel.text = "\(i)"
                        
                    }
                    
                    xPos = xPos+50
                    horizontalLabel.backgroundColor = UIColor.red
                    self.scrollViewOnLine.addSubview(horizontalLabel)
                    self.switch1Array.append(horizontalLabel)
                    
                }
                
                // Creating buttons in Horizontal way
                
                if(onlineData["axis"] as! String == "Horizontal" && onlineData["component"] as! String == "Button"){
                    let horizontalButton = UIButton()
                    horizontalButton.frame = CGRect(x: Int(xPos), y: Int(yPos), width: 50, height: 50)
                    if(onlineData["displayNumbers"] as! Int == 1){
                        var arrvalue = i - (arr.count * k)
                        
                        var key = arrvalue
                        if(arrvalue==25){
                            
                            k = k+1
                            
                        }
                        
                        
                        
                        horizontalButton.setTitle("\(arr[key])", for: UIControl.State.normal)
                    }
                    
                    if(onlineData["displayNumbers"] as! Int == 0){
                        horizontalButton.setTitle("\(i)", for: UIControl.State.normal)
                        
                    }
                    
                    
                    
                    xPos = xPos+50
                    horizontalButton.backgroundColor = UIColor.orange
                    self.scrollViewOnLine.addSubview(horizontalButton)
                    self.switch2Array.append(horizontalButton)
                    
                    
                }
                
                
                
                // Creating switches in Horizontal way
                
                if(onlineData["axis"] as! String == "Horizontal" && onlineData["component"] as! String == "Switch"){
                    
                    let horizontalSwitch = UISwitch()
                    
                    horizontalSwitch.frame = CGRect(x: Int(xPos), y: Int(yPos), width: 10, height: 10)
                    horizontalSwitch.onTintColor = .blue
                    horizontalSwitch.thumbTintColor = .red
                    horizontalSwitch.backgroundColor = UIColor.orange
                    xPos = xPos+50
                    self.scrollViewOnLine.addSubview(horizontalSwitch)
                    
                    self.switch3Array.append(horizontalSwitch)
                    
                   
                }
                
            }
            
            
            // Creating labels in vertical way
            
            // creating vertical Labels
            
            
            
            for i in 0...value{
                
                if(onlineData["axis"] as! String == "Vertical"){
                    var quantity:Int = onlineData["maxPerColumn"] as! Int
                    var output = i - (quantity * j)
                    if(output == quantity){
                        j = j+1
                       xPos = xPos + 50
                        yPos = 20
              
                        
                    }
                    
                }
                
                // Creating labels in vertical way
                
                if(onlineData["axis"] as! String == "Vertical" && onlineData["component"] as! String == "Label"){
                    let verticalLabel = UILabel()
                    verticalLabel.frame = CGRect(x: Int(xPos), y: Int(yPos), width: 50, height: 40)
                    if(onlineData["displayNumbers"] as! Int == 1){
                        var arrvalue = i - (arr.count * k)
                        var key = arrvalue
                        
                        if(arrvalue==25){
                            
                            k = k+1
                            
                        }
                        
                        verticalLabel.text = "\(arr[key])"
                        
                    }
                   
                    if(onlineData["displayNumbers"] as! Int == 0){
                        
                        verticalLabel.text = "\(i)"
                    }
                    
                    yPos = yPos+50
                    
                    verticalLabel.backgroundColor = UIColor.red
                    
                    self.scrollViewOnLine.addSubview(verticalLabel)
                    
                    self.switch1Array.append(verticalLabel)
                    
                    
                }
                
                // Creating buttons in vertical way
                
                
                
                if(onlineData["axis"] as! String == "Vertical" && onlineData["component"] as! String == "Button"){
                    
                    
                    let verticalButton = UIButton()
                    verticalButton.frame = CGRect(x: Int(xPos), y: Int(yPos), width: 50, height: 40)
                    if(onlineData["displayNumbers"] as! Int == 1){
                        var arrvalue = i - (arr.count * k)
                        var key = arrvalue
                        if(arrvalue==25){
                            
                            k = k+1
                        }
                        
                        verticalButton.setTitle("\(arr[key])", for: UIControl.State.normal)
                    }
                    
                    if (onlineData["displayNumbers"] as! Int == 0){
                        
                        verticalButton.setTitle("\(i)", for: UIControl.State.normal)
                    }
                    yPos = yPos+50
                    verticalButton.backgroundColor = UIColor.orange
                    self.scrollViewOnLine.addSubview(verticalButton)
                    self.switch2Array.append(verticalButton)
                    
                    
                }
                
                
                
                if(onlineData["axis"] as! String == "Vertical" && onlineData["component"] as! String == "Switch"){
                    
                    
                    let verticalSwitch = UISwitch()
                    verticalSwitch.frame = CGRect(x: Int(xPos), y: Int(yPos), width: 50, height: 50)
                    yPos = yPos+50
                    verticalSwitch.backgroundColor = UIColor.orange
                    self.scrollViewOnLine.addSubview(verticalSwitch)
                    self.switch3Array.append(verticalSwitch)
                    
                    
                    
                    
                }
                
                
            }
            
        }
        
        
        
        
        
        func getDetails() -> [String:Any]{
            
             var convertedData:[String:Any]!
            
            URLReqObj = URLRequest(url: URL(string:"https://www.brninfotech.com/tws/ComponentCreation.php")!)
            
            URLReqObj.httpMethod = "Get"
            
            dataTaskObj = URLSession.shared.dataTask(with: URLReqObj, completionHandler: { (data, connectionDetails, error) in
               print("got data from server")
                 do {
                    
                    convertedData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
                    print(convertedData)
                    
                } catch {
                    
                    print("Something went wrong")
                    
                }
                
            })
            dataTaskObj.resume()
                  while (convertedData == nil)
                
            {
                
            }
            
            return convertedData
            
        }
    
    
    @objc func stepperFn(){
    
        remove()
       
        value = Int(stepperOnLine.value)
         components()
    
    }

        



}


