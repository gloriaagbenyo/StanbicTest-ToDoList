//
//  ListViewController.swift
//  StanbicList
//
//  Created by Gloria Agbenyo on 14/04/1400 AP.
//  Copyright © 1400 Gloria Agbenyo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
   
    @IBOutlet var TableView: UITableView!
    
    
    class CLIENTS{
        var fname: String?
        var lname: String?
        var mobile: String?
    }
    
    
    
    var nclients = [CLIENTS]()
    
    var databaseRef: CollectionReference?

   // var clients = [users]()
    //var ClientsRef: CollectionReference
    
    override func viewDidLoad() {
        super.viewDidLoad()
          TableView.dataSource = self
           TableView.delegate = self
        
        
            databaseRef = Firestore.firestore().collection("clients")
        databaseRef?.getDocuments{ (snapshot, error) in
            if let err = error {
                debugPrint("Error fetching docs: \(err)")
            }else{
                guard let snap = snapshot else {return}
                for document in snap.documents{
                    let data = document.data()
                    let fname = data["first name"] as? String ?? ""
                    let lname = data["lastname"] as? String ?? ""
                    let mobile = data["Telephone"] as? String ?? ""
                    let newClients = CLIENTS()
                self.nclients.append(newClients)
                }
                self.TableView.reloadData()
                }

        }
        
    }
    
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  nclients.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newClients = nclients[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = newClients.fname
        cell.textLabel?.text = newClients.lname
        cell.textLabel?.text = newClients.mobile


        return cell
        
        
       }

    @IBAction func AddTapped(_ sender: Any) {
        let AddViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.AddViewController) as? AddViewController
        
        view.window?.rootViewController = AddViewController
        view.window?.makeKeyAndVisible()
    }
    


}
