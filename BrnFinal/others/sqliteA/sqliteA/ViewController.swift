
import UIKit

import SQLite

class ViewController: UIViewController
{

    
    @IBOutlet var nameTF: UITextField!
    
    
    @IBOutlet weak var mobileNo: UITextField!
    
    
    
    var dbConnection:Connection!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        
        print(path)
        
        
        do
        {
            dbConnection = try Connection("\(path)UserDetails.sqlite3")
        }
        catch
        {
            print("Unable To Connect")
        }
        
        
        createTable()
        
        
        
        //updateData()
        
        //deleteData()
        
        fetchData()
        
    }
    
    
    @IBAction func buttonTapped(_ sender: Any)
    {
        insetData(firsName: nameTF.text!, mobileNo: mobileNo.text!)
        
    }
    
    
    func createTable()
    {
        do
        {
            try dbConnection.run("CREATE TABLE IF NOT EXISTS UserDetails (id INTEGER PRIMARY KEY AUTOINCREMENT, firstName text, mobileNo text)")
        }
        catch
        {
            print("Error While Creating Table")
        }
    }
    
    func insetData(firsName:String, mobileNo:String)
    {
        do
        {
            
            try dbConnection.run("INSERT INTO UserDetails (firstName, mobileNo) VALUES(?,?)",firsName,mobileNo)
        }
        catch
        {
            print("Catch Error : failed to insert ")
        }
    }
    
    
    
    func updateData()
    {
        
        do
        {
            
            try dbConnection.run("UPDATE UserDetails SET firstName = 'Rajesh', mobileNo = '121212' WHERE id = 1")
        }
        catch
        {
            print("Catch Error : failed to update ")
        }
    }
    
    
    func deleteData()
    {
        do
        {
            
            try dbConnection.run("DELETE FROM UserDetails WHERE id = 4")
        }
        catch
        {
            print("Catch Error : failed to update ")
        }
    }
    
    func fetchData()
    {
        do
        {
            
            let data = try dbConnection.run("SELECT * FROM UserDetails")
            
            
            for row in data
            {
                print("Name : ", row[1] as! String)
                
                print("Number : ", row[2] as! String)
            }
        }
        catch
        {
            print("Catch Error : failed to update ")
        }
    }
    


}

