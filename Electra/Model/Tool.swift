//
//  Tool.swift
//  Electra
//
//  Created by M Yogi Satriawan on 12/04/23.
//

import Foundation


struct Tool: Codable, Hashable {
    var index: Int
    var name: String
    var quantity: Int
    var power: Int
    var usageTimePerHour: Int
    var repeatDays: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    static func == (lhs: Tool, rhs: Tool) -> Bool {
        return lhs.name == rhs.name
    }
}

