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
    
    var body: some View {
        Form{
            TextField("Task Name", text: $text)
            
            Button("Add"){
                self.taskStore.tasks.append(
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
