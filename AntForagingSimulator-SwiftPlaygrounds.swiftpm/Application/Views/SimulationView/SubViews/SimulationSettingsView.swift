import SwiftUI

struct SimulationSettingsView: View {
    
    @ObservedObject var viewModel: SimulationViewModel
    
    var body: some View {
        
        VStack {
            HStack {
                
                Spacer()
                
                VStack(alignment: .center, spacing: 12) {
                    
                    HStack {
                        
                        Text("Settings")
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 45, weight: .regular))
                            .onTapGesture {
                                viewModel.showMenu = false
                            }
                        
                    }
                    
                    Divider()
                        .background(.white)
                        .padding(.vertical, 5)
                    
                    Group {
                        SliderView(viewModel: SliderViewModel(.antWanderStrength), targetSliderValue: $viewModel.antWanderStrength)
                        
                        Divider()
                            .background(.gray)

                        SliderView(viewModel: SliderViewModel(.antSpeed), targetSliderValue: $viewModel.antSpeed)
                        
                        Divider()
                            .background(.gray)
                    }
                    
                    Group {
                        SliderView(viewModel: SliderViewModel(.antTargetingInterval), targetSliderValue: $viewModel.antTargetingInterval)
                        
                        Divider()
                            .background(.gray)

                        SliderView(viewModel: SliderViewModel(.pheromoneDecayTime), targetSliderValue: $viewModel.pheromoneDecayTime)
                        
                        Divider()
                            .background(.gray)

                        SliderView(viewModel: SliderViewModel(.pheromoneDepositInterval), targetSliderValue: $viewModel.pheromoneDepositInterval)

                        Divider()
                            .background(.gray)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        
                        ActionButton(title: "Save", backgroundColor: .green) {
                            viewModel.saveSettings()
                        }
                        
                        ActionButton(title: "Reset", backgroundColor: .gray) {
                            viewModel.resetSettings()
                        }
                    }
                    .padding(.vertical, 10)
                    
                }
                .frame(width: 350, height: 650, alignment: .leading)
                .padding(20)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.35))
                }
            }
            
            Spacer()
        }
    }
}
