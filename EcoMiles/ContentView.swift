import SwiftUI

struct ContentView: View
{
    @State private var showMenu = false

    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                Color("Alabaster").ignoresSafeArea()
                
                VStack(spacing: 24) {
                    
                    Text("EcoMiles")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundColor(Color("DarkGreen"))
                    
                    Text("Track your miles.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("DarkGreen"))
                    
                    Text("Grow your impact.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("DarkGreen"))
                    
                    
                    Text("🌿 Welcome to EcoMiles, an app that helps you measure your carbon footprint based on how you travel—empowering you to make greener choices, one mile at a time. 🌿")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundColor(Color("DarkGreen"))
                    
                    NavigationLink(destination: Score()) {
                        Text("Calculate Your Carbon Score")
                            .foregroundColor(Color("DarkGreen"))
                            .padding()
                            .frame(width: 350, height: 70)
                            .background(Color("box"))
                            .cornerRadius(12)
                            .shadow(radius: 12)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding()
                .navigationTitle("Welcome")
                .foregroundColor(Color("DarkGreen"))
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: { showMenu = true }) {
                            Image(systemName: "line.3.horizontal")
                                .imageScale(.large)
                        }
                    }
                }
                
                .sheet(isPresented: $showMenu) {
                    MenuView()
                }
            }
        }
    }
}


struct MenuView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Welcome", destination: ContentView())
                NavigationLink("Score", destination: Score())
                NavigationLink("Forest", destination: Forest())
                NavigationLink("Tips", destination: Tips())
                NavigationLink("FAQs", destination: FAQs())
                NavigationLink("About Us", destination: About_us())
            }
            .navigationTitle("Menu")
        }
    }
}


struct ScoreView: View { var body: some View { Text("Score Page") } }
struct ForestView: View { var body: some View { Text("Forest Page") } }
struct TipsView: View { var body: some View { Text("Tips Page") } }
struct FAQsView: View { var body: some View { Text("FAQs Page") } }
struct AboutUsView: View { var body: some View { Text("About Us Page") } }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

