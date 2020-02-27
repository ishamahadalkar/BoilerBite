//
//  MainViewController.swift
//  BoilerBite
//
//  Created by Isha Mahadalkar on 2/22/20.
//  Copyright © 2020 Isha Mahadalkar. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Menu for Windsor 01-13-2020
        let testMenu = getMeal(hall: "windsor", date: "2020-01-13")

        print("All Hours")
        let diningHours = getDiningHours(menu: testMenu)
        print(diningHours)
        
        print("BLD Hours")
        let BLDHours = getBLDHours(menu: testMenu)
        print(BLDHours)
        
        print("Late Lunch Hours")
        let LLHours = getLLHours(menu: testMenu)
        print(LLHours)
        
        let testMenu2 = getMeal(hall: "windsor", date: "2020-01-18")
        
        print("Weekend Meal Hours")
        let weekendHours = getDiningHours(menu: testMenu2)
        print(weekendHours)
    }
    
    @IBAction func unwindToMainViewController(unwindSegue: UIStoryboardSegue) {
        // Do not need to do anything
    }
    
    
    let URL_SAVE_TEAM = URL(string: "http://10.192.122.81/MyWebService/api/createteam.php")
       
       //TextFields declarations
       @IBOutlet weak var textFieldName: UITextField!
       @IBOutlet weak var textFieldMember: UITextField!
    
       // the content inside UC
       //Button action method
       @IBAction func buttonSave(sender: UIButton) {
        
        
        //created NSURL
        //let requestURL = NSURL(string: URL_SAVE_TEAM)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest()
        
        //setting the method to post
        request.httpMethod = "POST"
        
        //getting values from text fields
//        let username = textFieldName.text
//        let password = textFieldMember.text
        let username = "uday"
        let password = "password"
        
        // name = username, memeberCount=password
        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "username="+username+"&password="+password;
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                print("error is \(String(describing: error))")
                return;
            }
        
            //parsing the response
            do {
                //converting resonse to NSDictionary
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                //parsing the json
                if let parseJSON = myJSON {
                    
                    //creating a string
                    var msg : String!
                    
                    //getting the json response
                    msg = parseJSON["message"] as! String?
                    
                    //printing the response
                    print(msg!)
                    
                }
            } catch {
                print(error)
            }
            
        }
        //executing the task
        task.resume()
       }
    // added by UC
    
    // added by UC
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
