//
//  topHeader.swift
//  Instagram
//
//  Created by Le NK on 4/24/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class TopHeader: UITableViewCell {

    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
