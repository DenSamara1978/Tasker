//
//  TaskTableViewController.swift
//  Tasker
//
//  Created by Denis Vlaskin on 21.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {

    var currentTask: Taskable = Task ( parentTask: nil )
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var navbar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navbar.title = currentTask.taskName
        backButton.isEnabled = ( currentTask.parent != nil )
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTask.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell else {
            preconditionFailure( "Can't dequeue TaskCell" )
        }
        cell.configure ( task: currentTask.tasks [indexPath.row])
        return cell
    }
    
    @IBAction func appendNewTask(_ sender: Any) {
        let newSubtask = Task (parentTask: currentTask)
        currentTask.tasks.append(newSubtask)
        tableView.reloadData()
    }
    
    @IBAction func backToParentTask(_ sender: Any) {
        guard let task = currentTask.parent else { return }
        revision(newTask: task)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = currentTask.tasks [indexPath.row]
        revision(newTask: task)
    }
    
    private func revision ( newTask: Taskable ) {
        navbar.title = newTask.taskName
        backButton.isEnabled = ( newTask.parent != nil )
        currentTask = newTask
        tableView.reloadData()
    }
}
