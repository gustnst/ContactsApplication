//
//  ContactViewController.swift
//  Contacts
//
//  Created by Admin on 03.12.2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import Foundation

class ContactViewController: UIViewController {
    var contactName: String?
    var contactPhone: String?
    
    var key = String()
  
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
 
    @IBOutlet weak var addBut: UIButton!
    @IBAction func add(_ sender: Any) {
        contactName = nameTextField.text
        contactPhone = phoneTextField.text
  
        let tableController = navigationController?.viewControllers.first as? ContactsTableViewController
        
        if(contactName != nil){
            key = "\(contactName![(contactName?.startIndex)!])"
            let contact = Contact(name: contactName!, phone: contactPhone!)
            if tableController?.contactDictionary[key] != nil{
                tableController?.contactDictionary[key]?.append(contact)
                
            }
            else{
                tableController?.contactDictionary[key] = [contact]
            }
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: tableController?.contactDictionary)
            UserDefaults.standard.set(encodedData, forKey: "contactDictionary")
            
            tableController?.tableView.reloadData()
        }
        
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = contactName
        phoneTextField.text = contactPhone
    /*if !isEditMode{
            nameTextField.isEnabled=false
            phoneTextField.isEnabled=false
            addBut.isHidden=true
        }*/

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
