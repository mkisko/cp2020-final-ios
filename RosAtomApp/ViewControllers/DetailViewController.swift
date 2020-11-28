//
//  DetailViewController.swift
//  RosAtomApp
//
//  Created by Admin on 28.11.2020.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    
    @IBOutlet weak var ownerLabel: UILabel!
    
    @IBOutlet weak var contentview: UIView!
    @IBOutlet weak var createButton: UIButton!
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
        let ok = UIAlertAction(title: "Продолжить", style: .default) { [weak self] (ok) in
            self?.navigationController?.popViewController(animated: true)
        }
        let alert = UIAlertController(title: "Успешно", message: "Уведомление о выполнении задачи отправлено.", preferredStyle: .alert)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    @IBOutlet weak var hoursLabel: UILabel!
    
    @IBAction func isHardbutton(_ sender: UIButton) {
        let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
        let alert = UIAlertController(title: "Возникли сложности?", message: "Обратитесь к постановщику задачи, он указан в карточке.", preferredStyle: .alert)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    var task: TaskModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.minimumScaleFactor = 0.5
        createButton.layer.cornerRadius = 13
        setShadow(view: contentview)
        contentview.layer.cornerRadius = 15
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.minimumZoomScale = 0.5
        if let task = self.task {
            titleLabel.text = task.title
            dateLabel.text = task.date
            descriptionLabel.text = task.description
            ownerLabel.text = "\(task.owner.fio)\n\(task.owner.position)"
            
            switch task.hours {
            case 1:
                hoursLabel.text = "Время выполнения \(task.hours) час"

            case 2,3,4:
                hoursLabel.text = "Время выполнения \(task.hours) часа"

            case 4...:
                hoursLabel.text = "Время выполнения \(task.hours) часов"

            default:
                hoursLabel.text = "Время выполнения \(task.hours) часов"
            }
        }
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

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }


}
