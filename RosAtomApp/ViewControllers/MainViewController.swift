//
//  MainViewController.swift
//  RosAtomApp
//
//  Created by Admin on 27.11.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    private var allTasks: [TaskModel]? = [TaskModel(isImportent: true,
                                                    status: "Важно",
                                                    title: "Работа по наладке оборудования для новых конденсационных турбин.",
                                                    description: "Необходимо произвести наладку оборудования для новой системы запуска. Первый запуск через неделю. По всем вопросам обращаться к мастеру Александру Андреевичу.",
                                                    owner: User(fio: "Каплин К.А.", position: "Начальник цеха"),
                                                    comments: [],
                                                    hours: 2,
                                                    date: "25 ноября 10:30",
                                                    users: [User(fio: "Державин С.В.", position: "Мастер"), User(fio: "Абдурахманов А.А.", position: "Рабочий")]),
                                          TaskModel(isImportent: true,
                                                    status: "Важно",
                                                    title: "Работа по наладке оборудования для новых конденсационных турбин.",
                                                    description: "Необходимо произвести наладку оборудования для новой системы запуска. Первый запуск через неделю. По всем вопросам обращаться к мастеру Александру Андреевичу.",
                                                    owner: User(fio: "Каплин К.А.", position: "Начальник цеха"),
                                                    comments: [],
                                                    hours: 2,
                                                    date: "25 ноября 10:30",
                                                    users: [User(fio: "Державин С.В.", position: "Мастер"), User(fio: "Абдурахманов А.А.", position: "Рабочий")]),
                                          TaskModel(isImportent: true,
                                                                                          status: "Срочно",
                                                                                          title: "Заменить шарниры на СТ-320",
                                                                                          description: "Необходимо произвести замену шарниров системы СТ-320 в связи с плановым обслуживанием. Первый запуск через неделю. По всем вопросам обращаться к мастеру Александру Андреевичу.",
                                                                                          owner: User(fio: "Каплин К.А.", position: "Начальник цеха"),
                                                                                          comments: [],
                                                                                          hours: 4,
                                                                                          date: "25 ноября 12:30",
                                                                                          users: [User(fio: "Куценко П.А.", position: "Менеджер"), User(fio: "Абдурахманов А.А.", position: "Рабочий")]),
                                          TaskModel(isImportent: true,
                                                                                          status: "Требуется отчет",
                                                                                          title: "Произвести инвентаризацию на складе СИЗ",
                                                                                          description: "Необходимо произвести инвентаризаю склада средств индивидуальной защиты. По завершению инвентаризации отчет мастеру цеха Державину С.В. по форме 3-В.",
                                                                                          owner: User(fio: "Каплин К.А.", position: "Начальник цеха"),
                                                                                          comments: [],
                                                                                          hours: 2,
                                                                                          date: "25 ноября 10:30",
                                                                                          users: [User(fio: "Державин С.В.", position: "Мастер"), User(fio: "Степанов В.В.", position: "Зав.склада")]),
                                          TaskModel(isImportent: false,
                                                                                          status: "",
                                                                                          title: "Проверка работоспособности системы вентиляции",
                                                                                          description: "Произвести проверку системы вентиляции в 3-ем цеху. При выявлении неисправностей доложить начальнику цеха.",
                                                                                          owner: User(fio: "Губин Н.А.", position: "Пожарный инспектор"),
                                                                                          comments: [],
                                                                                          hours: 2,
                                                                                          date: "25 ноября 10:30",
                                                                                          users: [User(fio: "Смирнов Д.Р.", position: "Инженер"), User(fio: "Абдурахманов А.А.", position: "Рабочий")])]
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}


// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {return }
        guard let task = allTasks?[indexPath.row] else { return }
        detailVC.task = task
        
        show(detailVC, sender: nil)
    }
    
}


// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
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
