import SwiftUI

struct Score: View {
    @State private var distanceKm: Double = 0.0
    @State private var carbonKg: Double = 0.0
    @State private var selectedMode = "Car"

    let transportModes = ["Car", "Bus", "Train", "Bicycle", "Walking"]

    var body: some View {
        ZStack {
            Color("Alabaster").ignoresSafeArea()

            VStack(spacing: 30) {
                Text("Your Carbon Score")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color("DarkGreen"))

                
                VStack(spacing: 10) {
                    Text("Enter distance traveled:")
                        .font(.subheadline)
                        .foregroundColor(Color("DarkGreen"))

                    TextField("Kilometers", value: $distanceKm, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                        .padding(.horizontal)
                }

               
                VStack {
                    Text("Select transport mode:")
                        .font(.subheadline)
                        .foregroundColor(Color("DarkGreen"))

                    Picker("Transport Mode", selection: $selectedMode) {
                        ForEach(transportModes, id: \.self) { mode in
                            Text(mode)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                }

                
                Button("Calculate Score") {
                    carbonKg = distanceKm * emissionFactor(for: selectedMode)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("DarkGreen"))
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)

                // Score result
                VStack(spacing: 8) {
                    Text("\(carbonKg, specifier: "%.2f") kg CO₂")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(scoreColor)

                    Text(scoreMessage)
                        .font(.headline)
                        .foregroundColor(scoreColor)
                }

                // See forest
                NavigationLink(destination: Forest(score: carbonKg)) {
                    Text("See Your Forest")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("DarkGreen"))
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            .navigationTitle("Score")
        }
    }

    // MARK: – Helpers

    func emissionFactor(for mode: String) -> Double {
        switch mode {
        case "Car": return 0.121
        case "Bus": return 0.089
        case "Train": return 0.041
        case "Bicycle", "Walking": return 0.0
        default: return 0.121
        }
    }

    var scoreColor: Color {
        switch carbonKg {
        case ..<1.0: return Color("FernGreen")
        case ..<3.0: return Color("Olivine")
        default:     return .red
        }
    }

    var scoreMessage: String {
        switch carbonKg {
        case ..<1.0: return "Excellent!"
        case ..<3.0: return "Good Job"
        default:     return "Try Again Tomorrow"
        }
    }
}
