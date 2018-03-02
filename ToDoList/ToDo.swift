//
//  ToDo.swift
//  ToDoList
//
//  Created by Vincent on 02/03/2018.
//  Copyright © 2018 Native App Studio. All rights reserved.
//

import Foundation

struct ToDo {
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(title: "ToDo 1", isComplete: false,
                         dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "ToDo 2", isComplete: false,
                         dueDate: Date(), notes: "Notes 2")
        let todo3 = ToDo(title: "ToDo 3", isComplete: false,
                         dueDate: Date(), notes: "Notes 3")
        
        return [todo1, todo2, todo3]
    }
 }
