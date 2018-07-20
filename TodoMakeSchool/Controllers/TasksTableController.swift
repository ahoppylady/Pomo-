//
//  TasksTableController.swift
//  TodoMakeSchool
//
//  Created by William Fernandes on 7/16/18.
//  Copyright © 2018 William Fernandes. All rights reserved.
//

import UIKit

class TasksTableController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks: [Task] = []{
        didSet{
            taskTableView.reloadData()
        }
    }
    
    @IBOutlet weak var taskTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTableView.delegate = self
        taskTableView.dataSource = self
        
        for index in 1...3 {
            tasks.append( Task(name: "Task \(index)") )
            //tasks.append( Task(name: "Tarefa \(index)", createdDate: Date(), priority: index, dueDate: Date(), isCompleted: false, category: nil, pomoCount: 0) )
            
        }
        /****Programatically add button to "Add/Create Task" [Begin]****/
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
        
        self.performSegue(withIdentifier: "yves", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "listTaskTableViewCell") as! ListTaskTableViewCell
        let task = tasks[indexPath.row]
        cell.taskTitleLabel.text = task.name
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        let backItem = UIBarButtonItem()
        //        backItem.title = "Tasks"
        //        navigationItem.backBarButtonItem = backItem
        
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
            
        case "yves":
            
            guard let task = sender as? Task else { return }
            let dvc = segue.destination as! DisplayTaskViewController
            dvc.task = task
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
    /***************Deleting and Editing a task *****************/
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            self.tasks.remove(at: indexPath.row)
        }
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            // edit item at indexPath
            let taskSelected = self.tasks[indexPath.row]
            self.performSegue(withIdentifier: "yves", sender: taskSelected)
        }
        
        edit.backgroundColor = UIColor.blue
        
        return [delete, edit]
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
