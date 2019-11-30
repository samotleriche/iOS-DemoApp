//
//  Landmarks.swift
//  TaskList
//
//  Created by Tomas Leriche on 11/26/19.
//  Copyright © 2019 Tomas Leriche. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(/*@START_MENU_TOKEN@*/"Turtle Rock"/*@END_MENU_TOKEN@*/)
                    .font(.title)
                    .foregroundColor(.green)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct Landmarks_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail()
    }
}
