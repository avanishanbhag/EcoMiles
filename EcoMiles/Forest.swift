import SwiftUI

struct Forest: View {
    var score: Double = 0.0
   
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color("SkyTop"), Color("SkyBottom")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
           
            VStack {
                Spacer()
               
               
                HStack(spacing: treeSpacing) {
                    ForEach(0..<treeCount(), id: \.self) { _ in
                        TreeShape()
                            .fill(Color("DarkGreen"))
                            .frame(width: treeSize, height: treeSize * 1.6)
                    }
                }
                .padding(.bottom, 20)
               
              
                Rectangle()
                    .fill(Color("PakistanGreen"))
                    .frame(height: 150)
            }
        }
        .navigationTitle("Your Forest")
    }
   
    private func treeCount() -> Int {
        switch score {
        case ..<1.0: return 6
        case ..<3.0: return 4
        case ..<5.0: return 3
        default:     return 1
        }
    }
   
    private var treeSize: CGFloat {
        switch score {
        case ..<1.0: return 70
        case ..<3.0: return 55
        case ..<5.0: return 40
        default:     return 30
        }
    }
   
    private var treeSpacing: CGFloat {
        switch score {
        case ..<1.0: return 12
        case ..<3.0: return 20
        case ..<5.0: return 30
        default:     return 40
        }
    }
}


struct TreeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
       
       
        let trunkHeight = rect.height * 0.25
        let trunkWidth = rect.width * 0.2
        let trunkY = rect.maxY - trunkHeight
       
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: trunkY))
        path.addLine(to: CGPoint(x: rect.maxX, y: trunkY))
        path.closeSubpath()
       
    
        let trunkX = rect.midX - trunkWidth / 2
        path.addRect(CGRect(x: trunkX, y: trunkY, width: trunkWidth, height: trunkHeight))
       
        return path
    }
}

struct Forest_Previews: PreviewProvider {
    static var previews: some View {
        Forest(score: 2.5)
    }
}

