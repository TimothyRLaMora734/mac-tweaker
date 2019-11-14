//
//  Tweak.swift
//  Mac Tweaker
//
//  Created by donbot on 14.11.2019.
//  Copyright © 2019 robotmafia. All rights reserved.
//

import Foundation

class Tweak {
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

        return(output!)
    }
}

