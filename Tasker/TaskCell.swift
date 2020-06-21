//
//  TaskCellTableViewCell.swift
//  Tasker
//
//  Created by Denis Vlaskin on 21.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var subtaskCountLabel: UILabel!
    
    public func configure ( task: Taskable ) {
        taskNameLabel.text = task.taskName
        subtaskCountLabel.text = "\(task.tasks.count)"
    }
}
