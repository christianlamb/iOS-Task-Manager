//
//  TaskViewControler.swift
//  TaskManager
//
//  Created by Christian Lamb on 11/26/18.
//  Copyright © 2018 Christian Lamb. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class TaskViewControler: UIViewController{

    
    //@IBOutlet
    
    @IBOutlet var TableView: UITableView!
    
    
    var taskArray = ArrayOfTask()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskArray.arrayOfTask.append(Task(title: "This is a test", timeToComplete: Date(), details: "Dont care", completeStatus: false, importance: 0))
        taskArray.arrayOfTask.append(Task(title: "This is a test3", timeToComplete: Date(), details: "Dont care", completeStatus: false, importance: 1))
        taskArray.arrayOfTask.append(Task(title: "This is a test2", timeToComplete: Date(), details: "Dont care", completeStatus: false, importance: 2))
      TableView.tableFooterView = UIView()
        
            }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TableView.reloadData()
    }
    
 }
   



extension TaskViewControler:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.arrayOfTask.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TaskCell
        
        let task = taskArray.arrayOfTask[indexPath.row]
        cell.setupCell(task:task)
        //This sets the background color of the cell
        //With free time try to make a switch statement instead 
        if taskArray.arrayOfTask[indexPath.row].importance == 0 {
            cell.backgroundColor = .green
        }
        if taskArray.arrayOfTask[indexPath.row].importance == 1 {
            cell.backgroundColor = .yellow
        }
        if taskArray.arrayOfTask[indexPath.row].importance == 2{
            cell.backgroundColor = .red
        }

        return cell
}

}
