//
//  ActiveTaskCell.swift
//  RosAtomApp
//
//  Created by Admin on 28.11.2020.
//

import UIKit

class ActiveTaskCell: UITableViewCell {

    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var TaskStatusLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setubSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setubSubviews() {
        self.backgroundColor = .white
        circleView.layer.cornerRadius = 7
        
        mainView.layer.cornerRadius = 15
        setShadow(view: mainView)
    }
    
    func setShadow(view: UIView) {
        view.layer.shadowColor = UIColor(red: 0.488, green: 0.785, blue: 1, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 15
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: 15).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
    }
}
