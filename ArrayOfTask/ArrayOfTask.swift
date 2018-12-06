//
//  ArrayOfTask.swift
//  TaskManager
//
//  Created by Christian Lamb on 11/27/18.
//  Copyright © 2018 Christian Lamb. All rights reserved.
//

import Foundation

class ArrayOfTask {
    static let sharedInstance = ArrayOfTask()
    var arrayOfTask = [Task]()
}
