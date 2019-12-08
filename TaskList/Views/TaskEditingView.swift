//
//  TaskEditingView.swift
//  TaskList
//
//  Created by Tomas Leriche on 12/8/19.
//  Copyright © 2019 Tomas Leriche. All rights reserved.
//

import SwiftUI

struct TaskEditingView: View {
    @Binding var task: Task
    
    var body: some View {
        Form {
            TextField("Name", text: $task.name)
            Toggle("Completed", isOn: $task.completed)
        }
    }
}

struct TaskEditingView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEditingView(
            task: .constant( Task(name: "To do"))
        )
    }
}
