//
//  ContactsTableViewCell.swift
//  Contacts
//
//  Created by Admin on 02.12.2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    var addAction: (() -> Void)?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
