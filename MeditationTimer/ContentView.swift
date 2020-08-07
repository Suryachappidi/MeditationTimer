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
    
    @ObservedObject var timerManager = TimerManager()
    
    let avaialableMinutes = Array(1...59)
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text(secondsToMinutesAndSeconds(seconds:timerManager.secondsLeft))
                    .font(.system(size: 80))
                    .padding(.top,100)
                
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill":"play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .foregroundColor(.purple)
                    .onTapGesture(perform: {
                        self.timerManager.timerMode == .running ? self.timerManager.pause():self.timerManager.start()
                })
                
                if timerManager.timerMode == .paused{
                    Image(systemName: "gobackward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.top,40)
                        .onTapGesture(perform: {
                        self.timerManager.reset()
                    })
                }
                
                if timerManager.timerMode == .initial{
                    Picker(selection: $selectedPickerIndex, label: Text("Hello")) {
                        ForEach(0..<avaialableMinutes.count){
                            Text("\(self.avaialableMinutes[$0]) min")
                        }
                    }
                    .onTapGesture(perform: {
                    if self.timerManager.timerMode == .initial{
                        self.timerManager.setTimerLength(minutes: self.avaialableMinutes[self.selectedPickerIndex]*60)
                    }
                })
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
