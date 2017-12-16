//
//  Contact.swift
//  Contacts
//
//  Created by Admin on 02.12.2017.
//  Copyright © 2017 Admin. All rights reserved.
//
import Foundation

class Contact: NSObject, NSCoding {
    var name = String()
    var phone = String()
    init(name: String, phone: String){
        self.name=name
        self.phone=phone
    }
    required init(coder decoder: NSCoder){
        self.name = decoder.decodeObject(forKey: "name") as! String
        self.phone = decoder.decodeObject(forKey: "phone") as! String
    }
    func encode(with coder: NSCoder){
        coder.encode(name, forKey: "name")
        coder.encode(phone, forKey: "phone")
    }
}
