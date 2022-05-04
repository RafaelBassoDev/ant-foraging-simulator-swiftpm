import SwiftUI

struct SimulationButtonView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Show Settings")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 350, height: 50, alignment: .center)
                    .padding(20)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.35))
                    }
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            showMenu = true
                        }
                    }
            }
            Spacer()
        }
    }
}
