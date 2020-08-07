//
//  Helper.swift
//  MeditationTimer
//
//  Created by Surya Chappidi on 06/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import Foundation

enum TimerMode {
    case running
    case paused
    case initial
}

func secondsToMinutesAndSeconds(seconds:Int) -> String{
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    let minutesStamp = minutes.count > 1 ? minutes: "0" + minutes
    let secondsStamp = seconds.count > 1 ? seconds: "0" + seconds
    return "\(minutesStamp):\(secondsStamp)"
}
