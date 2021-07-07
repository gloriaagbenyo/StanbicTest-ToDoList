//
//  LoginViewController.swift
//  StanbicList
//
//  Created by Gloria Agbenyo on 14/04/1400 AP.
//  Copyright © 1400 Gloria Agbenyo. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet var Email: UITextField!
    
    @IBOutlet var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginTapped(_ sender: Any) {
        

        let email = Email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
              let password = Password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
              
              // Signing in the user
                     Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                         
                         if error != nil {
                             // Couldn't sign in
                            
                         }
                         else {
                             
                             let ListViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.ListViewController) as? ListViewController
                             
                             self.view.window?.rootViewController = ListViewController
                             self.view.window?.makeKeyAndVisible()
                         }
                     }
              
              
          }
    
    @IBAction func RegisterTapped(_ sender: Any) {
        let SignUpViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.SignUpViewController) as? SignUpViewController
        
        view.window?.rootViewController = SignUpViewController
        view.window?.makeKeyAndVisible()
    }
}
    


