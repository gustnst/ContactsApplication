//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Admin on 02.12.2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import Foundation

class ContactsTableViewController: UITableViewController {
     let userDefaults = UserDefaults.standard
    var contactDictionary = Dictionary<String, [Contact]>()//([String:[Contact]])//["A" : [Contact(name: "Abi",phone: "98789"),Contact(name: "Anna",phone: "12345")], "B":[Contact(name: "Bob",phone: "208780")]]

    func updateDict(key: String, contact: Contact){
        
        if contactDictionary[key] != nil{
            contactDictionary[key]?.append(contact)
        } else {
            contactDictionary[key] = [contact]
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = UserDefaults.standard.data(forKey: "contactDictionary") {
          //  print("yep")
            contactDictionary = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String : [Contact]]
            tableView.reloadData()
        }
        else{
           // print("nope")
        }
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return [String](contactDictionary.keys).sorted().count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = [String](contactDictionary.keys).sorted()[section]
        return contactDictionary[key]!.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) //as!ContactsTableViewCell
        let key = [String](contactDictionary.keys).sorted()[indexPath.section]
        cell.textLabel?.text = contactDictionary[key]?[indexPath.row].name
        cell.detailTextLabel?.text = contactDictionary[key]?[indexPath.row].phone
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let key = [String](contactDictionary.keys).sorted()[indexPath.section]
            
            if contactDictionary[key]?.count == 1 {
                contactDictionary.removeValue(forKey: key)
                let indexSet = IndexSet(integer: indexPath.section)
                tableView.deleteSections(indexSet, with: .fade)
            } else {
                contactDictionary[key]?.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return [String](contactDictionary.keys).sorted()[section]
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /*if let url = URL(string: "tel://\(Phone)"), UIApplication.shared.canOpenURL(url) {
         if #available(iOS 10, *) {
         UIApplication.shared.open(url)
         } else {
         UIApplication.shared.openURL(url)
         }
         }*/
        
        let key = [String](contactDictionary.keys).sorted()[indexPath.section]
        let alert = UIAlertController(title: "Calling...", message: "\((contactDictionary[key]?[indexPath.row].name)!)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        let recentController = self.tabBarController?.viewControllers![1] as? RecentTableViewController
        let date = Date()
        let dateFornatter = DateFormatter()
        dateFornatter.timeStyle = DateFormatter.Style.short
        dateFornatter.dateStyle = DateFormatter.Style.short
        dateFornatter.string(from: date)
        let s : String = dateFornatter.string(from: date)
        print(s)
        recentController?.callAccepted(date: s, name: (contactDictionary[key]?[indexPath.row].name)!)
        recentController?.tableView.reloadData()
 }
    
}
