//
//  ForestViewModel.swift
//  EcoMiles
//
//  Created by Scholar on 7/17/25.
//

import Foundation

class ForestViewModel: ObservableObject {
    @Published var logs: [ForestLog] = []

    private let storageKey = "forest_logs"

    init() {
        loadLogs()
    }

    func addLog(score: Double) {
        let today = Calendar.current.startOfDay(for: Date())
        
        // Replace today's entry if it already exists
        logs.removeAll { Calendar.current.isDate($0.date, inSameDayAs: today) }
        logs.append(ForestLog(date: today, score: score))
        saveLogs()
    }

    func loadLogs() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let saved = try? JSONDecoder().decode([ForestLog].self, from: data) {
            logs = saved
        }
    }

    private func saveLogs() {
        if let data = try? JSONEncoder().encode(logs) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
}

