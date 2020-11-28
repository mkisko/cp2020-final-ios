//
//  CurrentViewController.swift
//  RosAtomApp
//
//  Created by Admin on 28.11.2020.
//

import UIKit

class CurrentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var allTasks: [TaskModel]? = [TaskModel(isImportent: true, status: "Важно", description: "Работа по наладке оборудования для новых конденсационных турбин.", date: "25 ноября 10:30"), TaskModel(isImportent: true, status: "Важно", description: "Доложить начальнику участка о ходе выполнения работ.", date: "25 ноября 15:30"), TaskModel(isImportent: false, status: "", description: "Ежемесячный инструктаж по технике безопасности", date: "25 ноября 18:00"), TaskModel(isImportent: true, status: "Важно", description: "Работа по наладке оборудования для новых конденсационных турбин.", date: "25 ноября 10:30"), TaskModel(isImportent: true, status: "Важно", description: "Доложить начальнику участка о ходе выполнения работ.", date: "25 ноября 15:30"), TaskModel(isImportent: false, status: "", description: "Ежемесячный инструктаж по технике безопасности", date: "25 ноября 18:00")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        navigationController?.navigationBar.barTintColor = .white
    }
    
    private func setupSubviews() {
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


// MARK: - UITableViewDelegate
extension CurrentViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


// MARK: - UITableViewDataSource
extension CurrentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTasks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActiveCell", for: indexPath) as? ActiveTaskCell else {
            return UITableViewCell()
        }
        
        if let task = allTasks?[indexPath.row] {
            cell.descriptionLabel.text = task.description
            cell.DateLabel.text = task.date
            if task.isImportent {
                cell.TaskStatusLabel.isHidden = false
                cell.circleView.isHidden = false
                cell.TaskStatusLabel.text = task.status
            } else {
                cell.TaskStatusLabel.isHidden = true
                cell.circleView.isHidden = true
            }
            
        }
        
        return cell
    }
    
}
