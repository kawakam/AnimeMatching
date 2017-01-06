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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var favoriteAnimationTextField: UITextField!

    var locationManager: CLLocationManager!
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!
    
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
        guard let newLocation = locations.last, CLLocationCoordinate2DIsValid(newLocation.coordinate) else {return}

        latitude = newLocation.coordinate.latitude
        longitude = newLocation.coordinate.longitude
        
    }
    
    @IBAction func informationTransmission(_ sender: UIButton) {
        
        favoriteAnimationTextField.resignFirstResponder()
        
        // nifty
        let obj = NCMBObject(className: "TestClass")
        obj?.setObject(latitude, forKey: "Latitude")
        obj?.setObject(longitude, forKey: "Longitude")
        obj?.setObject(nameTextField.text, forKey: "Name")
        obj?.setObject(favoriteAnimationTextField.text, forKey: "FavoriteAnimation")
        
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
