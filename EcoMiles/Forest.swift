import SwiftUI

struct Forest: View {
    var score: Double = 0.0

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("SkyTop"), Color("SkyBottom")],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                Text("Your Forest")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("DarkGreen"))
                    .padding()

                Spacer()

                let type = treeType(for: score)
                let count = treeCount(for: score)

                HStack(spacing: 16) {
                    ForEach(0..<count, id: \.self) { _ in
                        TreeShape(type: type)
                    }
                }

                Spacer()

                Rectangle()
                    .fill(Color("PakistanGreen"))
                    .frame(height: 120)
            }
        }
    }

    private func treeCount(for score: Double) -> Int {
        switch score {
        case ..<1.0: return 6
        case ..<3.0: return 4
        case ..<5.0: return 3
        default: return 1
        }
    }

    private func treeType(for score: Double) -> TreeType {
        switch score {
        case ..<1.0: return .large
        case ..<3.0: return .medium
        case ..<5.0: return .small
        default: return .dead
        }
    }
}
