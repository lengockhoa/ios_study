//
//  FeatureCell.swift
//  baitapWebservice
//
//  Created by Le NK on 5/8/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class FeatureCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var ownerLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
