//
//  LoggerViewModel.swift
//  Bbox
//
//  Created by Peyman Eshtiagh on 02/04/16.
//  Copyright © 2016 Bbox. All rights reserved.
//

import Foundation

class LoggerViewModel {

    var seconds = 0
    var logger = Logger()
    

    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
        
    }

    
    func saveLogTime (savedLogTime: Int) -> (Int, Int, Int) {
        
     return secondsToHoursMinutesSeconds(logger.savedLogTime)
        
    }
    
    //secondsDidChange(String: )
    
    
}

struct Logger {
    
    var savedLogTime: Int
    
    init(){
        savedLogTime = 0
    }
    init(savedLogTime: Int){

        self.savedLogTime = savedLogTime
        
    }
}

class UserDefaults: NSUserDefaults {

    func saveLogToMemory(savedValue: Int, savedKey: String){
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(savedValue, forKey: savedKey)
        defaults.synchronize()
    }
    
    func loadLogFromMemory(savedKey: String){
        
        let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var savedTimeFromLogger = defaults.integerForKey(savedKey)
    }
    
}