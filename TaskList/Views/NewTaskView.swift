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
                ForEach(taskStore.prioritizedTasks) { index in
                    SectionView(prioritizedTask: self.$taskStore.prioritizedTasks[index])
                }
            }
        .listStyle(GroupedListStyle())
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


