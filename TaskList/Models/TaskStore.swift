//
//  TaskStore.swift
//  TaskList
//
//  Created by Tomas Leriche on 11/17/19.
//  Copyright © 2019 Tomas Leriche. All rights reserved.
//
import Combine

class TaskStore: ObservableObject {
    @Published var tasks = [
        "30 Pushups",
        "50 Situps",
        "20 lunges",
        "10 squates",
        "50 curls",
        "25 down to up curls",
        "15 bent down strokes"
        ] .map { Task(name: $0) }
}
