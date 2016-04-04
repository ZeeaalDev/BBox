//
//  LoggerViewController.swift
//  Bbox
//
//  Created by Peyman Eshtiagh on 31/03/16.
//  Copyright © 2016 Bbox. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import MapKit


class LoggerViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var viewModel: LoggerViewModel = LoggerViewModel()

    var timer = NSTimer()
    var timerIsOn = false
    let locationManager = CLLocationManager()
    var savedLogValue = 0
    var loggedSessionVC = LoggedSessionViewController()

    @IBAction func saveButton(sender: AnyObject) {
    }

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func stopLogButton(sender: AnyObject) {
        
        timer.invalidate()
        var savedValue:Int = viewModel.seconds
        UserDefaults().saveLogToMemory(viewModel.seconds, savedKey: "savedKey1")
        let (h,m,s) = viewModel.secondsToHoursMinutesSeconds(viewModel.seconds)
        timerLabel.text = "\(h):\(m):\(s)"
        timerIsOn = false
    }
    
    @IBAction func startLogButton(sender: AnyObject) {
        
        if timerIsOn == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
            timerIsOn = true
        
        }
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
        
    }

    func updateTimer(){
        
        viewModel.seconds++
        let (h,m,s) = viewModel.secondsToHoursMinutesSeconds(viewModel.seconds)
        timerLabel.text = "\(h):\(m):\(s)"
        
        }
    
    //MARK: - Location delegate methods
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        self.mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors: " + error.localizedDescription)
    }
    
     
}