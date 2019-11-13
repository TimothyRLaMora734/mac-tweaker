//
//  ViewController.swift
//  Mac Tweaker
//
//  Created by Aleksandr Bukhalo on 13.11.2019.
//  Copyright © 2019 robotmafia. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    let userDefaults = UserDefaults(suiteName: "com.apple.Finder")

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        if (userDefaults!.bool(forKey: "AppleShowAllFiles")) {
            FinderHiddenFilesOutlet.state = NSControl.StateValue.on
        } else {
            FinderHiddenFilesOutlet.state = NSControl.StateValue.off
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

