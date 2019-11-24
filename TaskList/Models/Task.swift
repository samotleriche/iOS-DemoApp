//
//  Task.swift
//  TaskList
//
//  Created by Tomas Leriche on 11/17/19.
//  Copyright © 2019 Tomas Leriche. All rights reserved.
//
import Foundation

struct Task: Identifiable {
    let id = UUID()
    
    var name: String
    var completed = false
    
}
