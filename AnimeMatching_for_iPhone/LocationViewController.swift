//
//  LocationViewController.swift
//  AnimeMatching_for_iPhone
//
//  Created by 川上智樹 on 2016/11/25.
//  Copyright © 2016 yatuhasiumai. All rights reserved.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var latTextField: UITextField!
    @IBOutlet weak var lngTextField: UITextField!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.requestLocation()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.stopUpdatingLocation()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - CLLocationManager delegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last,
            CLLocationCoordinate2DIsValid(newLocation.coordinate) else {
                self.latTextField.text = "Error"
                self.lngTextField.text = "Error"
                return
        }
        
        self.latTextField.text = "".appendingFormat("%.4f", newLocation.coordinate.latitude)
        self.lngTextField.text = "".appendingFormat("%.4f", newLocation.coordinate.longitude)
        
        // nifty
        let latitude = newLocation.coordinate.latitude
        let longitude = newLocation.coordinate.longitude
        
        let obj = NCMBObject(className: "TestClass")
        obj?.setObject(latitude, forKey: "latitude")
        obj?.setObject(longitude, forKey: "longitude")
        
        obj?.saveInBackground({(error) in
            if (error != nil) {
                // 保存に失敗した場合の処理
                print("error")
            }else{
                // 保存に成功した場合の処理
                print("succeeded")
            }
        })
        
    }
}
