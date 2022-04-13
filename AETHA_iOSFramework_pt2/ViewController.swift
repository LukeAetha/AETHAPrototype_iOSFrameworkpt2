//
//  ViewController.swift
//  AETHA_iOSFramework_pt2
//
//  Created by Lukas Dworschak on 13.04.22.
//


import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = UIHostingController(rootView: DataView())
        addChild(vc)
        vc.view.frame = self.view.frame
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
}

