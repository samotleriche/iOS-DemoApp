//
//  NewestTaskView.swift
//  TaskList
//
//  Created by Tomas Leriche on 11/24/19.
//  Copyright © 2019 Tomas Leriche. All rights reserved.
//

import SwiftUI

struct NewestTaskView: View {
    
    var taskStore: TaskStore
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var text = ""
    @State var priority: Task.Priority = .no
    
    var body: some View {
        Form{
            TextField("Task Name", text: $text)

            VStack {
                Text("Priority")
                Picker("Priority", selection: $priority.caseIndex) {
                    ForEach(Task.Priority.allCases.indices) { priorityIndex in
                        Text(
                            Task.Priority.allCases[priorityIndex].rawValue
                            .capitalized
                        )
                        .tag(priorityIndex)
                    }
                }
                .pickerStyle( SegmentedPickerStyle() )
            }
            
            Button("Add"){
                let priorityIndex = self.taskStore.getIndex(for: self.priority)
                self.taskStore.prioritizedTasks[priorityIndex].tasks.append(
                    Task(name: self.text)
                )
                
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(text.isEmpty)
        }
    }
}

struct NewestTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewestTaskView( taskStore: TaskStore() )
    }
}
