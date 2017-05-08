//
//  NormalCell.swift
//  baiWebservice
//
//  Created by Le NK on 5/5/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class NormalCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
