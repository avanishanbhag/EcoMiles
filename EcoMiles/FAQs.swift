//
//  FAQs.swift
//  EcoMiles
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI

struct FAQs: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Frequently Asked Questions")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                Group {
                                    FAQItem(question: "1. What is EcoMiles?",
                                            answer: "EcoMiles is a carbon footprint tracker that helps you understand and reduce your environmental impact, starting with how you travel.")
                                    FAQItem(question: "2. How does EcoMiles calculate my carbon footprint?",
                                            answer: "EcoMiles uses data about your transportation choices (modes, distances, frequency) to estimate CO₂ emissions using industry-standard carbon coefficients.")
                                    FAQItem(question: "3. What types of transportation are tracked?",
                                            answer: "We currently support car travel, biking, walking, and air-travel.")
                                    FAQItem(question: "4. Is my data private?",
                                            answer: "Yes! Your data is securely stored and never shared without your permission. You can delete your data at any time.")
                                    FAQItem(question: "5. What is the carbon score and how does it work?",
                                            answer: "Your forest grows the more sustainable your travel becomes. The greener your habits, the more lush and healthy your digital forest appears.")
                                    FAQItem(question: "6. Why didn’t my forest grow after I walked or biked?",
                                            answer: "It did! Walking or biking have a near-zero carbon footprint, and those actions earn you the most eco-points. Forest changes may update daily depending on your input.")
                                    FAQItem(question: "7. How often should I update my transportation data?",
                                            answer: "You can input your trips daily. For automatic tracking, make sure location permissions are enabled.")
                                    FAQItem(question: "8. What is a carbon footprint?",
                                            answer: "Your carbon footprint is the total amount of greenhouse gases, especially carbon dioxide, that you produce through your daily activities, like commuting or flying.")
                                    FAQItem(question: "9. Why does transportation matter for the climate?",
                                            answer: "Transportation accounts for nearly 30% of greenhouse gas emissions in many countries. Reducing your car use or switching to greener options can make a real difference.")
                                }
                            }
                            .padding()
                            .foregroundColor(Color("DarkGreen")) // Text color
                                    }
                                    .background(Color("Alabaster").edgesIgnoringSafeArea(.all)) // Background color
                        }
                    }
                

                struct FAQItem: View {
                    var question: String
                    var answer: String
                    
                    var body: some View {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(question)
                                .fontWeight(.bold)
                            Text(answer)
                        }
                    }
                }
#Preview {
    FAQs()
}
