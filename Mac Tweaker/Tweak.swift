//
//  Tweak.swift
//  Mac Tweaker
//
//  Created by donbot on 14.11.2019.
//  Copyright © 2019 robotmafia. All rights reserved.
//

import Foundation

class Tweak {
    init(domain: String, key: String) {
        self.domain = domain
        self.key = key
        self.status = Tweak.task(launchPath: "/usr/bin/defaults", arguments: ["read", self.domain, self.key])
        self.isSupported = true
    }
    
    let domain: String
    let key: String
    let status: String
    let isSupported: Bool
    
    func read() -> String {
        return Tweak.task(launchPath: "/usr/bin/defaults", arguments: ["read", self.domain, self.key])
    }
    
    func write(_ value: String) -> String {
        return Tweak.task(launchPath: "/usr/bin/defaults", arguments: ["write", domain, key, "-bool", value])
    }
    
    static func task(launchPath path: String, arguments args: [String]) -> String {
        let task = Process()
        task.launchPath = path
        task.arguments = args

        let pipe = Pipe()
        task.standardOutput = pipe
        task.standardError = pipe
        task.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)
        task.waitUntilExit()
        
        print(args)
        print(output as Any)

        return(output!)
    }
}

