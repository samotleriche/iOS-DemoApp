//
//  TaskStore.swift
//  TaskList
//
//  Created by Tomas Leriche on 11/17/19.
//  Copyright © 2019 Tomas Leriche. All rights reserved.
//
import Combine

class TaskStore: ObservableObject {
    
    
    @Published var prioritizedTasks = [
        PrioritizedTasks(
            priority: .high, names: [
                "50 Situps",
                "10 squates",
                "50 curls",
            ]
        ),
        PrioritizedTasks(
            priority: .medium, names: [
                "25 down to up curls",
                "15 bent down strokes",
        ]),
        PrioritizedTasks(
            priority: .low, names: [
                "30 Pushups",
        ]),
        PrioritizedTasks(
            priority: .no, names: [
                "20 lunges",
        ]),
    ]
    
    func getIndex(for priority: Task.Priority) -> Int {
        prioritizedTasks.firstIndex { $0.priority == priority }!
    }
}

private extension TaskStore.PrioritizedTasks {
    init(priority: Task.Priority, names: [String]) {
        self.init(
            priority: priority,
            tasks: names.map { Task(name: $0) }
        )
    }
}
