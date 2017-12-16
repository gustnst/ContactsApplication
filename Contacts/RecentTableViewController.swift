//
//  RecentTableViewController.swift
//  Contacts
//
//  Created by Admin on 02.12.2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class RecentTableViewController: UITableViewController {
    
    var recentDict = [String: [String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func callAccepted(date: String,name :String){
        if Array(recentDict.keys).contains(date){
            recentDict[date]?.append(name)
        }else{
            recentDict[date]=[name]
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return recentDict.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       let key = Array(recentDict.keys)[section]
        return recentDict[key]!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecCell", for: indexPath)
        let key = Array(recentDict.keys)[indexPath.section]
        cell.textLabel?.text = recentDict[key]?[indexPath.row]
       // cell.detailTextLabel?.text=
      //  cell.detailTextLabel?.text = contacts[indexPath.row].phone

        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(recentDict.keys)[section]
    }

}
