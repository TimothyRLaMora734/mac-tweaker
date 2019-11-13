//
//  ViewController.swift
//  Mac Tweaker
//
//  Created by Aleksandr Bukhalo on 13.11.2019.
//  Copyright © 2019 robotmafia. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func FinderHiddenFilesToggle(_ sender: NSButton) {
        let userDefaults = UserDefaults(suiteName: "com.apple.Finder")
        
        switch sender.state {
        case .on:
            userDefaults!.set(true, forKey: "AppleShowAllFiles")
        case .off:
            userDefaults!.set(false, forKey: "AppleShowAllFiles")
        default: break
        }
    }
}

