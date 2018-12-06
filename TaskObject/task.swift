//
//  task.swift
//  TaskManager
//
//  Created by Christian Lamb on 11/26/18.
//  Copyright © 2018 Christian Lamb. All rights reserved.
//


import UIKit


class Task {
    
    
    enum importance: Int {
        case notVeryImportant = 0
        case someWhatImportant = 1
        case veryImportant = 2
        
        
        
    }
    
    
    
    
    
    let title: String
    let timeToComplete: Date?
    let details: String
    var completeStatus: Bool 
    var importance: Int
    
    
    init(title: String, timeToComplete: Date, details: String, completeStatus: Bool, importance: Int) {
        self.title = title
        self.timeToComplete = timeToComplete
        self.details = details
        self.completeStatus = completeStatus
        self.importance = importance
    }
    
    
    
    
    
}
