import SwiftUI
import SpriteKit

struct SimulationView: View {
    
    @StateObject var viewModel = SimulationViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                    .ignoresSafeArea()
                
                SpriteView(scene: viewModel.getScene(with: proxy.size),
                           options: .ignoresSiblingOrder)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear {
                    
                }
                
                if viewModel.showMenu {
                    SimulationSettingsView(viewModel: viewModel)
                    
                } else {
                    SimulationButtonView(showMenu: $viewModel.showMenu)
                }
            }
        }
    }
}
