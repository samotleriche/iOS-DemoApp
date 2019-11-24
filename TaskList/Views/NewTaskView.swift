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
    
    var body: some View {
        TextField("Task Name", text: $text)
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
    }
}
