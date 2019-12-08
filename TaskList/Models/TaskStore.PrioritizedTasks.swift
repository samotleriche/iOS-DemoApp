//
//  TaskStore.PrioritizedTasks.swift
//  TaskList
//
//  Created by Tomas Leriche on 12/8/19.
//  Copyright © 2019 Tomas Leriche. All rights reserved.
//

extension TaskStore {
    struct PrioritizedTasks {
        let priority: Task.Priority
        var tasks: [Task]
    }
}

extension TaskStore.PrioritizedTasks: Identifiable {
    var id: Task.Priority { priority }
}
