//
//  NewTaskViewController.swift
//  RosAtomApp
//
//  Created by Admin on 28.11.2020.
//

import UIKit

protocol addNewTask: class {
    func addTask(task: TaskModel)
}
class NewTaskViewController: UIViewController {

    var pickerValue: String = ""
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var priorityPicker: UIPickerView!
    @IBOutlet weak var createButton: UIButton!
    @IBAction func createButtonTapped(_ sender: UIButton) {
        let title = titleField.text
        let description = descriptionTextView.text
        let hours = Int(timeSlider.value)
        let status = pickerValue
        let isImportent: Bool
        let time = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd MMMM yyyy HH:mm"
        let date = dateFormatter.string(from: time)
        
        
        if status == "Нет" {
            isImportent = false
        } else {
            isImportent = true
        }
        let task = TaskModel(isImportent: isImportent, status: status, title: title ?? "", description: description ?? "", owner: "Карпов К.А.", comments: [], hours: hours, date: date)
        
        
        let ok = UIAlertAction(title: "Продолжить", style: .default) { [weak self] (ok) in
            self?.tabBarController?.selectedIndex = 0
        }
        let alert = UIAlertController(title: "Успешно", message: "Новая задача добавлена.", preferredStyle: .alert)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerValue = priorityArray[row]
    }
    
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