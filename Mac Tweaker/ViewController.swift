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
    
    
    let finderShowWarningBeforeChangingFileExtensionD = Defaults(domain: "com.apple.Finder", key: "FXEnableExtensionChangeWarning")
    
    @IBOutlet weak var finderShowWarningBeforeChangingFileExtension: NSButton!
    
    @IBAction func finderShowWarningBeforeChangingFileExtension(_ sender: NSButton) {
        switch sender.state {
        case .on:
            finderShowWarningBeforeChangingFileExtensionD.set(true)
        case .off:
            finderShowWarningBeforeChangingFileExtensionD.set(false)
        default: break
        }
    }
    
    
    let showWarningBeforeRemovingFromiCloud = Defaults(domain: "com.apple.Finder", key: "FXEnableRemoveFromICloudDriveWarning")
    
    @IBOutlet weak var showWarningBeforeRemovingFromiCloudOutlet: NSButton!
    
    @IBAction func showWarningBeforeRemovingFromiCloudHandler(_ sender: NSButton) {
        switch sender.state {
        case .on:
            showWarningBeforeRemovingFromiCloud.set(true)
        case .off:
            showWarningBeforeRemovingFromiCloud.set(false)
        default: break
        }
    }
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        // Disable checkbox on unsupported OS versions
        if (!finderShowHiddenFiles.isSupported) {
            FinderHiddenFilesOutlet.isEnabled = false
        }
        
        // read setting state
        if (finderShowHiddenFiles.bool()) {
            FinderHiddenFilesOutlet.state = NSControl.StateValue.on
        } else {
            FinderHiddenFilesOutlet.state = NSControl.StateValue.off
        }
        
        // read setting state
        if (finderShowWarningBeforeChangingFileExtensionD.bool()) {
            finderShowWarningBeforeChangingFileExtension.state = NSControl.StateValue.on
        } else {
            finderShowWarningBeforeChangingFileExtension.state = NSControl.StateValue.off
        }
        
        // read setting state
        if (showWarningBeforeRemovingFromiCloud.bool()) {
            showWarningBeforeRemovingFromiCloudOutlet.state = NSControl.StateValue.on
        } else {
            showWarningBeforeRemovingFromiCloudOutlet.state = NSControl.StateValue.off
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}
