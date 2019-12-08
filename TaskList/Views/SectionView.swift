//
//  SectionView.swift
//  TaskList
//
//  Created by Tomas Leriche on 12/8/19.
//  Copyright © 2019 Tomas Leriche. All rights reserved.
//

import SwiftUI

struct SectionView: View {
    @Binding var prioritizedTask: TaskStore.PrioritizedTasks
    
    var body: some View {
        Section(
            header: Text(
                "\(prioritizedTask.priority.rawValue.capitalized) Priority"
            )
        )
        {
            ForEach(prioritizedTask.tasks) { task in
                RowView(task: self.$prioritizedTask.tasks[task])
            }
            .onMove { sourceIndicess, destinationIndex in
                self.prioritizedTask.tasks.move(fromOffsets: sourceIndicess, toOffset: destinationIndex)
            }
            .onDelete { indexSet in
                self.prioritizedTask.tasks.remove(atOffsets: indexSet)
            }
        }
    }
}

