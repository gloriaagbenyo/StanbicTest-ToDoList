//
//  AddViewController.swift
//  StanbicList
//
//  Created by Gloria Agbenyo on 14/04/1400 AP.
//  Copyright © 1400 Gloria Agbenyo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class AddViewController: UIViewController {


    @IBOutlet var fname: UITextField!
    @IBOutlet var lname: UITextField!
    @IBOutlet var mobile: UITextField!
    @IBOutlet var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ErrorLabel.alpha = 0


        // Do any additional setup after loading the view.
    }
    
    func validateFields() -> String? {
             
             // Check that all fields are filled in
                
                 if fname.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                  lname.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                  mobile.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                 
                   return "Please fill in all fields."
          }; return nil
      }
    
    
    

   
    @IBAction func AddTapped(_ sender: Any) {
        let error = validateFields()
              
              if error != nil {
                  
                  // There's something wrong with the fields, show error message
                  showError(error!)
              }
              else {
              
              let firstname = fname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
              let lastname = lname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
              let Tmobile = mobile.text!.trimmingCharacters(in: .whitespacesAndNewlines)
              
                  let db = Firestore.firestore()
                  db.collection("clients").addDocument(data: [
                      "first name": firstname,
                      "lastname": lastname,
                      "Telephone": Tmobile,
                  ]) { err in
                          if err != nil {
                              self.showError("Error adding document:")
                          } else {
                              self.showError("Successfull")
                              }
                          }
                  self.transitionToList()
                  }
    }
    

  func transitionToList() {
      
     let ListViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.ListViewController) as? ListViewController
      
      self.view.window?.rootViewController = ListViewController
      self.view.window?.makeKeyAndVisible()

      
  }
    
    func showError(_ message:String) {
          
          ErrorLabel.text = message
          ErrorLabel.alpha = 1
      }
      
      
   
    @IBAction func cancelTapped(_ sender: Any) {
        self.transitionToList()
    }
}
