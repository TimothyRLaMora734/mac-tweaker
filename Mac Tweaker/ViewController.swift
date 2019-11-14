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
    let finderShowWarningBeforeChangingFileExtensionD = Defaults(domain: "com.apple.Finder", key: "FXEnableExtensionChangeWarning")

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        // Disable checkbox on unsupported OS versions
        if (!finderShowHiddenFiles.isSupported) {
            FinderHiddenFilesOutlet.isEnabled = false
        }
        
        // read setting state
        if (finderShowHiddenFiles.read()) {
            FinderHiddenFilesOutlet.state = NSControl.StateValue.on
        } else {
            FinderHiddenFilesOutlet.state = NSControl.StateValue.off
        }
        
        // read setting state
        if (finderShowWarningBeforeChangingFileExtensionD.read()) {
            finderShowWarningBeforeChangingFileExtension.state = NSControl.StateValue.on
        } else {
            finderShowWarningBeforeChangingFileExtension.state = NSControl.StateValue.off
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBOutlet weak var finderShowWarningBeforeChangingFileExtension: NSButton!
    
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
    @IBAction func finderShowWarningBeforeChangingFileExtension(_ sender: NSButton) {
        switch sender.state {
        case .on:
            finderShowWarningBeforeChangingFileExtensionD.set(true)
        case .off:
            finderShowWarningBeforeChangingFileExtensionD.set(false)
        default: break
        }
    }
}
