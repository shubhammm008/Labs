//
//  ViewController.swift
//  TabBar
//
//  Created by Shubham Singh on 21/07/25.
//

import UIKit

class PinkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.badgeValue="4"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarItem.badgeValue=nil
    }

}

