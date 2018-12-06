//
//  AddTaskViewController.swift
//  TaskManager
//
//  Created by Christian Lamb on 11/26/18.
//  Copyright © 2018 Christian Lamb. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
//This is the list of segmenst for the segmented view controler.
    var segments: [(title: String, rating: Task.importance)] =
        [("Not Important", .notVeryImportant),
         ("Kinda Important", .someWhatImportant),
         ("Very Important", .veryImportant)
        ]
    
    //@IBOutlets
    
    
    @IBOutlet weak var AddTitleTextField: UITextField!
    
    @IBOutlet weak var DetailsTextView: UITextView!
    
    @IBOutlet weak var ImportanceSegmentedControler: UISegmentedControl!
    
    @IBOutlet weak var DatePickerView: UIDatePicker!
    //@IBFunc
    
    
    @IBAction func SaveTaskButton(_ sender: Any) {
        tryingToSave()
       
      
    }
    //Making a var for the arrayOfTask class
    var taskArray = ArrayOfTask()
    
    override func viewDidLoad() {
          super.viewDidLoad()
        
        DatePickerView.minimumDate = Date()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))//Adds gestureRecongizer for Taping.
        
        //This sets up the SegmentedControler.
        ImportanceSegmentedControler.removeAllSegments()
        
        for (index, segment) in segments.enumerated() {
        ImportanceSegmentedControler.insertSegment(withTitle: segment.title, at: index, animated: false)
        ImportanceSegmentedControler.selectedSegmentIndex = 0
        }
        
        
    }
    
    
    //Functions
    
    
    func errorMessage() {
        let missingTitleAlert = UIAlertController(title: "Error", message: "A field is not filled in", preferredStyle: .actionSheet)
        let okayAction = UIAlertAction(title: "Okay", style:UIAlertAction.Style.default )
        missingTitleAlert.addAction(okayAction)
        self.present(missingTitleAlert, animated: true, completion: nil)
    }
    
    
    func tryingToSave() {
        //Title
        guard
            let title = AddTitleTextField.text, !title.isEmpty
            else {
            errorMessage()
            return
            
        }
        //Details
        guard let details = DetailsTextView.text, !details.isEmpty  else {
            errorMessage()
         
            return
        }
       
        //Importance
        
    let importance =  ImportanceSegmentedControler.hashValue
        
        //Date
        let date = DatePickerView.date
        //This creates a var called new task that has all the traits that the user inputed.
        let newTask = Task(title: title, timeToComplete: date, details: details, completeStatus: false, importance: importance)
        //This adds the new task to the array of task
        taskArray.arrayOfTask.append(Task(title: title, timeToComplete: date, details: details, completeStatus: false, importance: importance))
        print(taskArray.arrayOfTask.count)
        //This is an alert that tell the user that the new task has been added.
         let newTaskAlert = UIAlertController(title: "New task", message: "You have added \(newTask.title) to the task manager", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        newTaskAlert.addAction(okayAction)
        self.present(newTaskAlert,animated: true, completion: nil)
        //This clears the textview and textfield
        AddTitleTextField.text = ""
        DetailsTextView.text = ""
        DatePickerView.date = Date()
        
        
        
    }

    
    

}




//extensions
extension AddTaskViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return segments.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return segments[row].title
    }
}
