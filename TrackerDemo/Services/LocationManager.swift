//
//  LocationManager.swift
//  TrackerDemo
//
//  Created by Steven Curtis on 01/09/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import GoogleMaps

protocol LocationManagerProtocol {
    var locationPermissionRelay: BehaviorRelay<CLAuthorizationStatus> { get }
    var locationRelay: BehaviorRelay<CLLocation?> { get }
    var distanceRelay: BehaviorRelay<CLLocationDistance> { get }
    var speedRelay: BehaviorRelay<CLLocationSpeed?> { get }
    var initialTripLocationRelay: BehaviorRelay<CLLocation?> { get }
}

class LocationManager: NSObject, LocationManagerProtocol, CLLocationManagerDelegate {
    static let shared = LocationManager()
    private let locationManager = CLLocationManager()
    private let disposeBag = DisposeBag()
    
    let locationPermissionRelay = BehaviorRelay<CLAuthorizationStatus>(
        value: CLLocationManager.authorizationStatus())
    
    let locationRelay = BehaviorRelay<CLLocation?>(value: nil)
    let speedRelay = BehaviorRelay<CLLocationSpeed?>(value: nil)
    let distanceRelay = BehaviorRelay<CLLocationDistance>(value: 0)
    let initialTripLocationRelay = BehaviorRelay<CLLocation?>(value: nil)
    
    private override init() {
        super.init()
        locationManager.delegate = self
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        self.locationManager.startUpdatingLocation()
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationPermissionRelay.accept(status)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        locationRelay.accept(currentLocation)
        speedRelay.accept(currentLocation.speed)
        
        if let initialTripLocation = initialTripLocationRelay.value {
            let distance = currentLocation.distance(from: initialTripLocation)
            distanceRelay.accept(distanceRelay.value + abs(distanceRelay.value - distance) )
        } else {
            initialTripLocationRelay.accept(currentLocation)
        }

    }
}
