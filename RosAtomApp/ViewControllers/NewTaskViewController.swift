//
//  NewTaskViewController.swift
//  RosAtomApp
//
//  Created by Admin on 28.11.2020.
//

import UIKit

class NewTaskViewController: UIViewController {

    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var priorityPicker: UIPickerView!
    @IBOutlet weak var createButton: UIButton!
    @IBAction func createButtonTapped(_ sender: UIButton) {
    }
    
    var priorityArray = ["Нет", "Важно", "Срочно", "Требует контроля", "Требует отчета", "Средний приоритет"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        priorityPicker.dataSource = self
        priorityPicker.delegate = self
        
        timeLabel.text = ["\(Int(timeSlider.value))", "часов"].joined(separator: " ")
        timeSlider.addTarget(self, action: #selector(dragedSlider), for: .valueChanged)
        setShadow(view: descriptionTextView)
        createButton.layer.cornerRadius = 13
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
    
    @objc func dragedSlider() {
        timeLabel.text = ["\(Int(timeSlider.value))", "часов"].joined(separator: " ")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


extension NewTaskViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        priorityArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return priorityArray[row]
    }
}
