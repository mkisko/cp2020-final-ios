//
//  InactiveTaskCell.swift
//  RosAtomApp
//
//  Created by Admin on 28.11.2020.
//

import UIKit

class InactiveTaskCell: ActiveTaskCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(displayP3Red: 229, green: 234, blue: 241, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
