//
//  LoggedSessionViewController.swift
//  Bbox
//
//  Created by Peyman Eshtiagh on 03/04/16.
//  Copyright © 2016 Bbox. All rights reserved.
//

import Foundation
import UIKit


class LoggedSessionViewController: UIViewController {

    var viewModel: LoggerViewModel = LoggerViewModel()
    var logger = Logger()
//    var savedTimeFromLogger = 0
    
   
//    init(savedTimeFromLogger: Int){
//        
//        self.savedTimeFromLogger = savedTimeFromLogger
//        
//    }
    
    @IBOutlet weak var loggedTimeLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        print(String(viewModel.saveLogTime(logger.savedLogTime)))
        
//            self.loggedTimeLabel.text = String(savedTimeFromLogger)
        let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var savedTimeFromLogger = defaults.integerForKey("savedValue1")
        let (h,m,s) = LoggerViewModel().secondsToHoursMinutesSeconds(savedTimeFromLogger)
        loggedTimeLabel.text! = "\(h):\(m):\(s)"
        print(loggedTimeLabel.text)
        print(String(savedTimeFromLogger))
    }

}