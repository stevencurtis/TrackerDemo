//
//  ViewController.swift
//  TrackerDemo
//
//  Created by Steven Curtis on 01/09/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    private var mainViewModel: MainViewModel!

    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var averageSpeedLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!

    init?(coder: NSCoder, locationManager: LocationManagerProtocol) {
        mainViewModel = MainViewModel(locationManager: locationManager)
        super.init(coder: coder)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

