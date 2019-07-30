//
//  SoundManager.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/30/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import Foundation
import AudioToolbox

struct SoundManager {
    
    var gameSound: SystemSoundID = 0
    
    
    mutating func loadDeniedSound() {
        let correctSound = Bundle.main.path(forResource: "AccessDenied", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: correctSound!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    mutating func loadGrantedSound() {
        let incorrectSound = Bundle.main.path(forResource: "AccessGranted", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: incorrectSound!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    
    func playGameSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
}
