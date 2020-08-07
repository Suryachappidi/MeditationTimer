//
//  TimerManager.swift
//  MeditationTimer
//
//  Created by Surya Chappidi on 07/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    
    @Published var timerMode: TimerMode = .initial
    
    @Published var secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
    
    var timer = Timer()
    
    func start(){
        timerMode = .running
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true,block: { timer in
            if self.secondsLeft == 0{
                self.reset()
            }
            self.secondsLeft -= 1
        }
        )
    }
    
    func reset() {
        self.timerMode = .initial
        self.secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
        timer.invalidate()
    }
    
    func pause() {
        self.timerMode = .paused
        timer.invalidate()
    }
    
    func setTimerLength(minutes:Int){
        let defaults = UserDefaults.standard
        defaults.set(minutes,forKey: "timerLength")
        secondsLeft = minutes
    }

}
