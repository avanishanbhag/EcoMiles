import SwiftUI

struct Score: View {
    @StateObject private var viewModel = TransportViewModel()

    @State private var useManualInput = true
    @State private var manualDistance: Double = 0.0
    @State private var trackingStarted = false

    let transportModes = ["Car", "Bus", "Train", "Bicycle", "Walking", "Plane"]

    var body: some View {
        ZStack {
            Color("Alabaster").ignoresSafeArea()

            VStack(spacing: 24) {
                Text("Your Carbon Score")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color("DarkGreen"))

                Picker("Input Type", selection: $useManualInput) {
                    Text("Manual Entry").tag(true)
                    Text("Track with GPS").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)

              
                if useManualInput {
                    VStack(spacing: 10) {
                        Text("Enter distance (in km):")
                            .font(.subheadline)
                            .foregroundColor(Color("DarkGreen"))

                        TextField("Distance", value: $manualDistance, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                            .padding(.horizontal)
                    }
                } else {
                    VStack(spacing: 10) {
                        Text("Live Tracking")
                            .font(.subheadline)
                            .foregroundColor(Color("DarkGreen"))

                        Text("\(viewModel.distanceKm, specifier: "%.2f") km tracked")
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color("PakistanGreen"))

                        Button(trackingStarted ? "Stop Tracking" : "Start Tracking") {
                            trackingStarted.toggle()
                            if trackingStarted {
                                viewModel.startTracking()
                            } else {
                                viewModel.stopTracking()
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(trackingStarted ? Color.red : Color("DarkGreen"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                }

      
                VStack(spacing: 10) {
                    Text("Select transport mode:")
                        .font(.subheadline)
                        .foregroundColor(Color("DarkGreen"))

                    Picker("Transport Mode", selection: $viewModel.selectedMode) {
                        ForEach(transportModes, id: \.self) { mode in
                            Text(mode)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                }

           
                Button("Calculate Carbon Score") {
                    let distance = useManualInput ? manualDistance : viewModel.distanceKm
                    let factor = viewModel.emissionFactor(for: viewModel.selectedMode)
                    viewModel.carbonScore = distance * factor
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("DarkGreen"))
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)

               
                VStack(spacing: 8) {
                    Text("\(viewModel.carbonScore, specifier: "%.2f") kg CO₂")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(scoreColor)

                    Text(scoreMessage)
                        .font(.headline)
                        .foregroundColor(scoreColor)
                }

              
                NavigationLink(destination: Forest(score: viewModel.carbonScore)) {
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

 
    private var scoreColor: Color {
        switch viewModel.carbonScore {
        case ..<1.0: return Color("FernGreen")
        case ..<3.0: return Color("Olivine")
        default:     return .red
        }
    }

    private var scoreMessage: String {
        switch viewModel.carbonScore {
        case ..<1.0: return "Excellent!"
        case ..<3.0: return "Good Job"
        default:     return "Try Again Tomorrow"
        }
    }
}
