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
    
    func read() -> Bool {
        self.defaults.bool(forKey: self.key)
    }
    
    func set(_ value: Any?) {
        self.defaults.set(true, forKey: self.key)
    }
    
    func isKeyPresentInUserDefaults(suiteName: String, forKey: String) -> Bool {
        return UserDefaults(suiteName: suiteName)?.object(forKey: forKey) != nil
    }
}

