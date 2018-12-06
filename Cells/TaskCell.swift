//
//  TaskCell.swift
//  TaskManager
//
//  Created by Christian Lamb on 11/26/18.
//  Copyright © 2018 Christian Lamb. All rights reserved.
//

import UIKit



class TaskCell: UITableViewCell {
   //A var to bring the task array over
    
    //@IBOutlets
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var CompleteStatus: UILabel!
    
    @IBOutlet weak var DueDateLabel: UILabel!
    
    
    
    
    
    
    func setupCell (task: Task) {
        
        TitleLabel.text = task.title
        switch task.completeStatus {
        case true :
            CompleteStatus.text = "Complete"
        case false :
            CompleteStatus.text = "Incomplete"
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.string(from: task.timeToComplete!)
        DueDateLabel.text = dateString
        
        
        
        
    }
    
    
    
    
    
}
