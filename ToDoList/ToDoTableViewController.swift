//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Vincent on 02/03/2018.
//  Copyright © 2018 Native App Studio. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var todos = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedToDos = ToDo.loadToDos() {
            todos = savedToDos
        } else {
            todos = ToDo.loadSampleToDos()
        }
        
        // provides the Edit button to delete multiple entries at once
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
    indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
        tableView.dequeueReusableCell(withIdentifier:
        "ToDoCellIdentifier") else {
            fatalError("Could not dequeue a cell")
        }
        
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        return cell
    }
    
    /// MARK: Override function that enables swiping over a cell to delete it
    override func tableView(_ tableView: UITableView, canEditRowAt
        indexPath: IndexPath) -> Bool {
        return true
    }
    
    /// MARK: Override function to remove a certain entry
    override func tableView(_ tableView: UITableView, commit
    editingStyle: UITableViewCellEditingStyle, forRowAt indexPath:
    IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: Unwind segue to To Do List after saving/cancelling a new entry
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! ToDoViewController
        
        if let todo = sourceViewController.todo {
            let newIndexPath = IndexPath(row: todos.count,
                section: 0)
            
            todos.append(todo)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
        }
        
    }
    
    
}
