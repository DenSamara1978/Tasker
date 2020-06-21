//
//  Task.swift
//  Tasker
//
//  Created by Denis Vlaskin on 21.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import Foundation

class Task: Taskable {
    var parent: Taskable?
    
    var tasks: [Taskable]
    
    var taskName: String
    
    static var taskNumber: Int = 0
    public init ( parentTask: Taskable? ) {
        Task.taskNumber += 1
        taskName = "Task \(Task.taskNumber)"
        tasks = []
        parent = parentTask
    }
    
    public func addSubtask ( subtask: Taskable ) {
        tasks.append ( subtask )
    }
}
