
//  Tips.swift
//  EcoMiles
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI

struct Tips: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Tips to Lower Your Carbon Footprint")
                    .font(.custom(
                        "brixton-sans-tc-regular", size: 36))
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

                Group {
                    TipItem(
                        tip: "Walk or bike instead of driving short distances. It's healthier and produces no emissions!",
                        source: "EPA: Greenhouse Gas Emissions from Transportation"
                    )
                    TipItem(
                        tip: "Use public transportation whenever possible to reduce your personal carbon output.",
                        source: "American Public Transportation Association"
                    )
                    TipItem(
                        tip: "Carpool with others to share emissions from trips.",
                        source: "EPA: What You Can Do - On The Road"
                    )
                    TipItem(
                        tip: "Fly less. Trains or buses have a lower carbon footprint than planes.",
                        source: "Our World in Data – Climate Impacts of Transport"
                    )
                    TipItem(
                        tip: "Choose energy-efficient vehicles like hybrids or EVs.",
                        source: "U.S. Department of Energy: Fuel Economy"
                    )
                    TipItem(
                        tip: "Keep your tires properly inflated to improve fuel efficiency.",
                        source: "DOE: Energy Saver – Driving More Efficiently"
                    )
                    TipItem(
                        tip: "Reduce idling — turn off your engine if waiting more than a minute.",
                        source: "Natural Resources Canada – Idle-Free Zone"
                    )
                    TipItem(
                        tip: "Plan errands to avoid backtracking and reduce unnecessary driving.",
                        source: "NRDC: How to Reduce Your Transportation Emissions"
                    )
                    TipItem(
                        tip: "Support policies that promote green transportation options.",
                        source: "UN Environment Programme – Sustainable Transport"
                        
                    )
                }
            }
            .padding()
            .foregroundColor(Color("DarkGreen"))
        }
        .background(Color("Alabaster").edgesIgnoringSafeArea(.all))
    }
}

struct TipItem: View {
    var tip: String
    var source: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("• \(tip)")
                .font(.body)
            Text("Source: \(source)")
                .font(.caption)
                .italic()
                .foregroundColor(.pakistanGreen)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    Tips()
}

