//
//  UsersTableViewCell.swift
//  Challenge
//
//  Created by Mohamed Magdy on 2/12/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func customizeCellWithModel(model: UserViewModel?) {
        nameLabel.text = model?.name
        usernameLabel.text = model?.username
        emailLabel.text = model?.email
        addressLabel.text = model?.address
    }
    
}
