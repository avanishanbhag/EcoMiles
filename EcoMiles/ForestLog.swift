//
//  ForestLog.swift
//  EcoMiles
//
//  Created by Scholar on 7/17/25.
//

import Foundation

struct ForestLog: Identifiable, Codable {
    let id = UUID()
    let date: Date
    let score: Double
}
