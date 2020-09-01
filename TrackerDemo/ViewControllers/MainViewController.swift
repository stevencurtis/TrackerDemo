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

    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewModel = MainViewModel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }


}

