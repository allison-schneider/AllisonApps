//
//  ListItemTableViewCell.swift
//  AllisonExercise2
//
//  Created by Allison Schneider on 7/16/19.
//  Copyright © 2019 Allison Schneider. All rights reserved.
//

import UIKit

class ListItemTableViewCell: UITableViewCell {

    @IBOutlet weak var listItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

