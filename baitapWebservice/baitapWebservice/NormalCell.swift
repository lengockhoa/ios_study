//
//  NormalCell.swift
//  baitapWebservice
//
//  Created by Le NK on 5/8/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class NormalCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
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
