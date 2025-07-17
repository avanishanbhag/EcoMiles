//
//  TreeShape.swift
//  EcoMiles
//
//  Created by Scholar on 7/17/25.
//

import SwiftUI

enum TreeType {
    case large
    case medium
    case small
    case dead
}

struct TreeShape: View {
    let type: TreeType

    var body: some View {
        VStack(spacing: 4) {
            switch type {
            case .large:
                Triangle()
                    .fill(Color("DarkGreen"))
                    .frame(width: 60, height: 90)
            case .medium:
                Triangle()
                    .fill(Color("FernGreen"))
                    .frame(width: 45, height: 70)
            case .small:
                Triangle()
                    .fill(Color("Olivine"))
                    .frame(width: 30, height: 50)
            case .dead:
                Rectangle()
                    .fill(.gray)
                    .frame(width: 10, height: 40)
            }

            if type != .dead {
                Rectangle()
                    .fill(Color("PakistanGreen"))
                    .frame(width: 10, height: 20)
            }
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}
