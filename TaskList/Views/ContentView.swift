//
//  ContentView.swift
//  TaskList
//
//  Created by Tomas Leriche on 11/17/19.
//  Copyright © 2019 Tomas Leriche. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var taskStore: TaskStore
    @State var modalIsPresented = false
    @State var secondPopUp = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 5...95) 
    @State var score = 0
    @State var roundNum = 1;
    let accentColor = Color(red: 0.0/255.0, green: 145.0/255.0, blue: 70.0/255.0)
    
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
            .foregroundColor(Color.white)
            .modifier(Shadow())
            .font(Font.custom("TrebuchetMS-Bold", size: 18))
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .foregroundColor(Color.white)
                .modifier(Shadow())
                .font(Font.custom("Verdana-Bold", size: 20))
        }
    }
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
        content
        .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct ButtonLrgStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                HStack {
                    Text("Try and put the Slider on the Value:")
                        .modifier(LabelStyle()).lineLimit(nil)
                    Text("\(target)")
                        .modifier(ValueStyle())
                }
                Spacer()
                HStack {
                    Spacer()
                    Text("  1  ").modifier(ValueStyle())
                    Spacer()
                    Slider(value: $sliderValue, in: 1...100).shadow(color: Color.black, radius: 5, x: 2, y: 2)
                        .accentColor(accentColor)
                    Spacer()
                    Text("100").modifier(ValueStyle())
                    Spacer()
                }
                
                Button(action: {
                    print("hellllooo")
                    self.modalIsPresented = true
                    }) {
                        Text("Hit Me!").font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                        
                    }
                    .alert(isPresented: $modalIsPresented) { () ->
                    Alert in
                        //let roundedValue = Int(sliderValue.rounded())
                        return Alert(title: Text(alertTitle()), message: Text("The Slider's value is \(sliderValueRounded()).\n"
                            + "You scored \(pointsForCurrentRound()) points this round"),
                                     dismissButton: .default(Text("Close")) {
                                        self.score += self.pointsForCurrentRound()
                                        self.target = Int.random(in: 1...100)
                                        self.roundNum += 1;
                            } )
                    }
                .background(Image("Button"))
                Spacer()
                HStack {
                    Button(action: {
                        self.startOver()
                    }){
                        HStack {
                            Image("StartOverIcon")
                            Text("Start Over").modifier(ButtonLrgStyle())
                        }
                        
                    }
                    .background(Image("Button"))
                    Spacer()
                    Text("Score:").modifier(LabelStyle())
                    Text("\(score)").modifier(ValueStyle())
                    Spacer()
                    Text("Round:").modifier(LabelStyle())
                    Text("\(roundNum)").modifier(ValueStyle())
                    Spacer()
                    
                    NavigationLink(destination: TestView()){
                        HStack {
                            Image("InfoIcon")
                            Text("Info").modifier(ButtonLrgStyle())
                        }
                    }
//                    NavigationLink(destination: NewTaskView()){
//                        HStack {
//                            Image("InfoIcon")
//                            Text("Info").modifier(ButtonLrgStyle())
//                        }
//                    }
                .background(Image("Button"))
                }.padding(.bottom, 20).padding(.leading, 20).padding(.trailing, 50)
            }
            .background(Image("Background2"), alignment: .center)
        .accentColor(accentColor)
        .navigationBarTitle("BullsEye")
            // score stuff
        }
//        NavigationView {
//            List(taskStore.tasks) { task in
//                Text(task.name)
//            }
//            .navigationBarTitle("Tasks")
//            .navigationBarItems(
//                trailing:
//                Button(
//                action: { self.modalIsPresented = true }
//                ) {
//                    Image(systemName: "plus")
//            })
//            Text("hello")
//        }
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        if difference == 0 {
            title = "Perfect!!!"
        } else if difference <= 5 {
            title = "So Close!!"
        } else if difference <= 10 {
            title = "Not Bad!"
        } else {
            title = "Are you even trying?!"
        }
        return title
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func perfectRandomNum() -> Int {
        var perfectNum = Int.random(in: 5...95)
        while abs(perfectNum - 50) <= 5 {
            perfectNum = Int.random(in: 5...95)
        }
        return perfectNum
    }
    
    func pointsForCurrentRound() -> Int {
        let maxScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 50
        } else if difference <= 5 {
            bonus = 20
        } else if difference <= 10 {
            bonus = 5
        } else {
            bonus = 0
        }
        return maxScore - difference + bonus
    }
    
    func startOver() {
        score = 0
        roundNum = 1
        sliderValue = 50.0
        target = perfectRandomNum()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskStore: TaskStore()
        )
            .previewLayout(.fixed(width: 896, height: 414))
    }
}


