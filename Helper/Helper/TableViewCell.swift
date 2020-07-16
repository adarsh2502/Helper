//
//  TableViewCell.swift
//  Helper
//
//  Created by Adarsh Gupta on 19/05/19.
//  Copyright © 2019 Adarsh Gupta. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var ProfLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
