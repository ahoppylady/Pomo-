//
//  TasksTableController.swift
//  TodoMakeSchool
//
//  Created by William Fernandes on 7/16/18.
//  Copyright © 2018 William Fernandes. All rights reserved.
//

import UIKit

class TasksTableController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks: [Task] = []

    @IBOutlet weak var taskTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTableView.delegate = self
        taskTableView.dataSource = self
        
        for index in 1...3 {
            tasks.append( Task(name: "Tarefa \(index)", createdDate: Date(), priority: index, dueDate: Date(), isCompleted: false, category: nil, pomoCount: 0) )
            
        }
        /****Programatically add button to "Add/Create Task" [Begin]****/
        //addStuff()
        var addTaskButton = UIButton(frame: CGRect(origin: CGPoint(x: self.view.frame.maxX - 75, y: self.view.frame.size.height - 140), size: CGSize(width: 50, height: 50)))
        addTaskButton.setTitle("+", for: .normal)
        addTaskButton.backgroundColor = UIColor(red:1.00, green:0.27, blue:0.32, alpha:1.0)
        addTaskButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        //adding action to the button
        addTaskButton.addTarget(self, action: #selector(addTaskClicked(_ :)), for: .touchUpInside)

        self.view.addSubview(addTaskButton)

        /****Programatically add button to "Add/Create Task" [End]****/
    }
    @objc func addTaskClicked(_ :UIButton){
        //insert segue to DisplayTaskViewController
        print("Add Task Tapped")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTaskTableViewCell") as! ListTaskTableViewCell
        
        let task = tasks[indexPath.row]
        
        cell.taskTitleLabel.text = task.name
        //cell.taskDueDateLabel.text = task.dueDate.toString(dateFormat: "dd-MM-yyyy")
        //cell.taskCompleteButton.setTitle(task.isCompleted.description, for: .normal)
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
            
        case "startPomo":
            
            if segue.destination is TimeViewController {
                
                let selectedIndex = taskTableView.indexPathForSelectedRow
                guard let index = selectedIndex?.row else {return}
                let selectedTask = tasks[index]
                
                let tvc =  segue.destination as? TimeViewController
                tvc?.task = selectedTask
            }
            
        case "addTask":
            print("create task bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
