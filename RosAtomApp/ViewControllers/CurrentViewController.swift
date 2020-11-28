//
//  CurrentViewController.swift
//  RosAtomApp
//
//  Created by Admin on 28.11.2020.
//

import UIKit

class CurrentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var allTasks: [TaskModel]? = [TaskModel(isImportent: true,
                                                    status: "Важно",
                                                    title: "Работа по наладке оборудования для новых конденсационных турбин.",
                                                    description: "Необходимо произвести наладку оборудования для новой системы запуска. Первый запуск через неделю. По всем вопросам обращаться к мастеру Александру Андреевичу.",
                                                    owner: "Карпов К.А.",
                                                    comments: [],
                                                    hours: 2,
                                                    date: "25 ноября 10:30"),
                                          TaskModel(isImportent: true,
                                                    status: "Важно",
                                                    title: "Доложить начальнику участка о ходе выполнения работ.",
                                                    description: "Необходимо произвести наладку оборудования для новой системы запуска. Первый запуск через неделю. По всем вопросам обращаться к мастеру Александру Андреевичу.",
                                                    owner: "Карпов К.А.",
                                                    comments: [],
                                                    hours: 5,
                                                    date: "25 ноября 15:30"),
                                          TaskModel(isImportent: false,
                                                    status: "",
                                                    title: "Ежемесячный инструктаж по технике безопасности",
                                                    description: "Состоится в актовом зале в 18:00. Всем мастерам обеспечить явку личного состава. При себе иметь маски.",
                                                    owner: "Карпов К.А.",
                                                    comments: [],
                                                    hours: 4,
                                                    date: "25 ноября 18:00")]
    
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {return }
        guard let task = allTasks?[indexPath.row] else { return }
        detailVC.task = task
        
        show(detailVC, sender: nil)
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
            cell.descriptionLabel.text = task.title
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
