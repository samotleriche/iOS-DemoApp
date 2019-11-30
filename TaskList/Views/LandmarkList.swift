//
//  LandmarkList.swift
//  TaskList
//
//  Created by Tomas Leriche on 11/28/19.
//  Copyright © 2019 Tomas Leriche. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            
            List(landmarkData) { landmark in
                NavigationLink(destination: LandmarkDetail()){
                    LandmarkRow(landmark: landmark)
                    
                }
            }
        .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
