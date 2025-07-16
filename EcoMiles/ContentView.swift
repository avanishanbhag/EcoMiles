import SwiftUI

struct ContentView: View {
    @State private var showMenu = false

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
               
                
                Text("EcoMiles")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Track your miles.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("DarkGreen"))

                Text("Grow your impact.")
                    .multilineTextAlignment(.center)
                
                
                Text("🌿 Welcome to EcoMiles, an app that helps you measure your carbon footprint based on how you travel—empowering you to make greener choices, one mile at a time. 🌿")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
               /* Text("""
                     1. **Track distance** – We record how many kilometers \
                     you travel by car (or any transport mode you pick).\n
                     2. **Apply emission factor** – Each km is multiplied by \
                     0.121 kg CO₂ (average gasoline‑car value). You’ll see a \
                     different factor if you choose bus, bike, etc.\n
                     3. **Grow your forest** – The lower today’s emissions, \
                     the more trees appear in your personal forest scene.
                     """)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                */
                
                NavigationLink(destination: Score()) {
                    Text("Calculate Your Carbon Score")
                        .foregroundColor(Color.black)
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

