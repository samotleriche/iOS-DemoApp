//
//  TestView.swift
//  TaskList
//
//  Created by Tomas Leriche on 11/18/19.
//  Copyright © 2019 Tomas Leriche. All rights reserved.
//

import SwiftUI

struct TestView: View {
    
    @State var alertVisible: Bool = false
    let beige = Color.init(red: 1, green: 214.0/255.0, blue: 179.0/255.0)
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .foregroundColor(Color.white)
            .modifier(Shadow())
            .font(Font.custom("TrebuchetMS-Bold", size: 18))
        }
    }
    
    struct BackgroundStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .background(Color.init(red: 1, green: 214.0/255.0, blue: 179.0/255.0))
           // 255, 214, 179
        }
    }
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            content
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    var body: some View {
        Group{
            VStack {
                Spacer()
                Text("🦏🐪🐫🦒🦘🐖🦌🐈🦚🦨🐁🦦🕊🦃")
                Spacer()
                HStack {
                    Spacer()
                    Text("🦙")
                    
                    Text("Hi This is the Info Page Lots of cool stuff here and here and here and so on and on.")
                        .modifier(LabelStyle())
                    
                    Text("🐖")
                    Spacer()
                }
                Spacer()
                    Text("🦏🐪🐫🦒🦘🐖🦌🐈🦚🦨🐁🦦🕊🦃")
                        Spacer()
            .navigationBarTitle("Info Tab")
                
            }
        .background(beige)
        }
    .background(Image("Background2"))
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
         .previewLayout(.fixed(width: 896, height: 414))
    }
}

