//
//  SignUpViewController.swift
//  StanbicList
//
//  Created by Gloria Agbenyo on 14/04/1400 AP.
//  Copyright © 1400 Gloria Agbenyo. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet var Email: UITextField!
    
    @IBOutlet var Password: UITextField!
    
    @IBOutlet var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ErrorLabel.alpha = 0


        // Do any additional setup after loading the view.
    }
    
    func validateFields() -> String? {
        
        ErrorLabel.alpha = 0

        // Check that all fields are filled in
        
            if Email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                Password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
              return "Please fill in all fields."
                 }
        // Check if the password is secure
       /* let cleanedPassword = Password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make your password is stonger"
        }*/
        
        return nil
    }
    
    @IBAction func SignUpTapped(_ sender: Any) {
        
        let error = validateFields()
               
               if error != nil {
                   
                   // There's something wrong with the fields, show error message
                   showError(error!)
               }
               else {
                   
                   // Create cleaned versions of the data
                  
                   let email = Email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   let password = Password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   
                   // Create the user
                   Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                       
                       // Check for errors
                       if err != nil {
                           
                           // There was an error creating the user
                           self.showError("Error creating user")
                       }
                    else {
                        
                        // Transition to the home screen
                        self.transitionToLogin()
                    }
    
                }
        }
}
    
   func showError(_ message:String) {
           
          ErrorLabel.text = message
          ErrorLabel.alpha = 1
      }
    
    
    func transitionToLogin() {
        
        let LoginViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.LoginViewController) as? LoginViewController
        
        view.window?.rootViewController = LoginViewController
        view.window?.makeKeyAndVisible()

        
    }
        
    @IBAction func HaveAccountTapped(_ sender: Any) {
        self.transitionToLogin()

        
    }
    
    
    
}
