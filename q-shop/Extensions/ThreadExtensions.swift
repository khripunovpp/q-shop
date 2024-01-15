//
//  ThreadExtensions.swift
//  q-shop
//
//  Created by Khripunov Pavel on 16/01/2024.
//

import Foundation

extension Thread {
    class func printCurrent() {
        print("\r⚡️: \(Thread.current)\r" + "🏭: \(OperationQueue.current?.underlyingQueue?.label ?? "None")\r")
    }
}
