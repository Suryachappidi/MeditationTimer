//
//  ContentView.swift
//  MeditationTimer
//
//  Created by Surya Chappidi on 06/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @State var timerMode: TimerMode = .initial
    @State var selectedPickerIndex = 0
    
    let avaialableMinutes = Array(1...59)
    
    var body: some View {
        NavigationView {
            VStack {
                Text("60")
                    .font(.system(size: 80))
                    .padding(.top,100)
                
                Image(systemName: timerMode == .running ? "play.circle.fill":"pause.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .foregroundColor(.purple)
                
                if timerMode == .paused{
                    Image(systemName: "gobackward")
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding(.top,40)
                }
                
                if timerMode == .initial{
                    Picker(selection: $selectedPickerIndex, label: Text("Hello")) {
                        ForEach(0..<avaialableMinutes.count){
                            Text("\(self.avaialableMinutes[$0]) min")
                        }
                    }
                .labelsHidden()
                }
                
                Spacer()
            }
            .navigationBarTitle("My Timer")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
