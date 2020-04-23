//
//  Defaults.swift
//  Mac Tweaker
//
//  Created by Aleksandr Bukhalo on 13.11.2019.
//  Copyright © 2019 robotmafia. All rights reserved.
//

import Foundation

class Defaults {
    let domain: String
    let key: String
    let isSupported: Bool
    private let defaults: UserDefaults
    private let osVersion: OperatingSystemVersion = ProcessInfo().operatingSystemVersion;
    
    init (domain: String, key: String) {
        self.domain = domain
        self.key = key
        self.defaults = UserDefaults(suiteName: domain)!
        self.isSupported = true
    }
    
    func bool() -> Bool {
        let cmd: String = RunCommand.task(launchPath: "/usr/bin/defaults", arguments: ["read", self.domain, self.key])
        return NSString(string: cmd).boolValue
    }
    
    func set(_ value: Bool) {
        RunCommand.task(launchPath: "/usr/bin/defaults", arguments: ["write", domain, key, "-bool", String(value)])
    }
}

