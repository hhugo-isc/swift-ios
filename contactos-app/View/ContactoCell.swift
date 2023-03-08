//
//  ContactoCell.swift
//  contactos-app
//
//  Created by administrador on 08/03/23.
//

import UIKit

class ContactoCell: UITableViewCell {

    @IBOutlet weak var nombreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
