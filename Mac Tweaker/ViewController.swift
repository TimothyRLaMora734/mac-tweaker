//
//  ViewController.swift
//  Mac Tweaker
//
//  Created by Aleksandr Bukhalo on 13.11.2019.
//  Copyright © 2019 robotmafia. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    let finderShowHiddenFiles = Defaults(domain: "com.apple.Finder", key: "AppleShowAllFiles")

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        // Disable checkbox on unsupported OS versions
        if (!finderShowHiddenFiles.isSupported) {
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
            finderShowHiddenFiles.set(true)
        case .off:
            finderShowHiddenFiles.set(false)
        default: break
        }
    }
}

