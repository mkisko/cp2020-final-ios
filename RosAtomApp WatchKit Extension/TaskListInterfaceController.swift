//
//  TaskListInterfaceController.swift
//  RosAtomApp WatchKit Extension
//
//  Created by Admin on 27.11.2020.
//

import UIKit
import WatchKit

class TaskListInterfaceController: WKInterfaceController {

    
   
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    var tasks = [WatchTaskModel(title: "Наладка оборудования в машинном зале", desc: "Необходимо произвести наладку оборудования для новой системы запуска сегодня в 14:00. Первый запуск через неделю. По всем вопросам обращаться к мастеру Александру Андреевичу."), WatchTaskModel(title: "Замена анализаторов", desc: "Необходимо заменить газовые анализаторы в третьем цеху."), WatchTaskModel(title: "Ремонт СТ-320", desc: "Вышел из строя выпускной поршень, необходим срочный ремонт."), WatchTaskModel(title: "Проверка вентиляции", desc: "Проверить вентиляционную систему. О результатах доложить начальнику цеха"), WatchTaskModel(title: "Инвентаризация", desc: "Провести инвентаризацию средств индивидуальной защиты на складе."), WatchTaskModel(title: "Медосмотр", desc: "Всем сотрудникам необходимо пройти медосмотр до 30.11 в медкабинете завода.")]

    
    override func awake(withContext context: Any?) {
        setupTable()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        self.pushController(withName: "detail", context: tasks[rowIndex])
    }
    
    func setupTable() {

        tableView.setNumberOfRows(tasks.count, withRowType: "TaskRow")
        
        var i = 0
        for item in tasks {
            let row = tableView.rowController(at: i) as! TaskRow
            row.titleLabel.setText(item.title)
            i+=1
        }
    }
    
}
