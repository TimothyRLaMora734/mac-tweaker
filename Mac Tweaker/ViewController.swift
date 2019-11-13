//
//  ViewController.swift
//  Mac Tweaker
//
//  Created by Aleksandr Bukhalo on 13.11.2019.
//  Copyright © 2019 robotmafia. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    let osVersion = ProcessInfo().operatingSystemVersion
    let userDefaults = UserDefaults(suiteName: "com.apple.Finder")
    
    func isKeyPresentInUserDefaults(suiteName: String, forKey: String) -> Bool {
        return UserDefaults(suiteName: suiteName)?.object(forKey: forKey) != nil
    }

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        // Disable checkbox on unsupported OS versions
        if (osVersion.majorVersion < 10 && osVersion.minorVersion < 12) {
            FinderHiddenFilesOutlet.isEnabled = false
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBOutlet weak var FinderHiddenFilesOutlet: NSButton!
    
    @IBAction func FinderHiddenFilesToggle(_ sender: NSButton) {
        switch sender.state {
        case .on:
            userDefaults!.set(true, forKey: "AppleShowAllFiles")
        case .off:
            userDefaults!.set(false, forKey: "AppleShowAllFiles")
        default: break
        }
    }
}

