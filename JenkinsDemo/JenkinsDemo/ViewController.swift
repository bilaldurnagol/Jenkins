//
//  ViewController.swift
//  JenkinsDemo
//
//  Created by Bilal Durnagöl on 25.11.2023.
//

import UIKit
import JenkinsSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        print(JenkinsSDK().name)
    }


}

