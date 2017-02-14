//
//  PostsTableViewCell.swift
//  Challenge
//
//  Created by Mohamed Magdy on 2/13/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func customizeCellWithModel(model: PostViewModel?) {
        titleLabel.text = model?.title
        bodyLabel.text = model?.body
    }
    
}
