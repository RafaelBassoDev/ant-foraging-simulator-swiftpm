import SwiftUI

struct SliderView: View {
    
    var viewModel: SliderViewModel

    @Binding var targetSliderValue: Double
    
    @State var showAlert: Bool = false
    
    var body: some View {
        HStack {
            Button {
                print("Show info")
            } label: {
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 30, weight: .regular))
                    .foregroundColor(.white)
                    .onTapGesture {
                        showAlert = true
                    }
            }
            .padding(.trailing, 10)
            
            VStack {
                Text("\(viewModel.title)")
                
                HStack {
                    Slider(value: $targetSliderValue, in: viewModel.range, step: viewModel.step)
                        .tint(.yellow)
                    Text("\(targetSliderValue, specifier: viewModel.specifier)")
                        .frame(width: 50, height: 20)
                }
            }
            .foregroundColor(.white)
            .font(.system(size: 18))
        }.alert(isPresented: $showAlert) {
            Alert(
                title: Text(viewModel.title),
                message: Text(viewModel.description)
            )
        }

    }
}
