//
//  NewTaskView.swift
//  TaskList
//
//  Created by Tomas Leriche on 11/17/19.
//  Copyright © 2019 Tomas Leriche. All rights reserved.
//

import SwiftUI

struct NewTaskView: View {
    @State var text = ""
    @State var modalIsPresented = false
    
    @ObservedObject var taskStore: TaskStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(taskStore.tasks) { task in
                    Text(task.name)
                }
                .onMove { sourceIndicess, destinationIndex in
                    self.taskStore.tasks.move(fromOffsets: sourceIndicess, toOffset: destinationIndex)
                }
                .onDelete { indexSet in
                    self.taskStore.tasks.remove(atOffsets: indexSet)
                }
            }
        .navigationBarTitle("Tasks")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                Button(action: {
                    self.modalIsPresented = true
                }) {
                    Image(systemName: "plus")
                }
            )
        }
        .sheet(isPresented: $modalIsPresented) {
            NewestTaskView(taskStore: self.taskStore)
        }
//        List(taskStore.tasks.indices) { index in
//            Text("\(self.taskStore.tasks[index].name)")
//        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(taskStore: TaskStore() )
    }
}
