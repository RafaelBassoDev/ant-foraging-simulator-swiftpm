import SwiftUI

struct OnboardingView: View {
    
    @StateObject var informationChapterViewModel = InformationChapterViewModel(from: InformationChapterDataSource.defaultChapters)
    
    @State var canStartSimulation: Bool = false
    
    @State var showScrollTextAlert: Bool = true
    
    @Binding var showOnboarding: Bool
    
    let listItemModels: [DescriptionListItemModel]
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack(alignment: .center) {
                
                Text("Ant Foraging Simulator")
                    .font(.system(size: 70, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                
                HStack {
                    
                    InformationChapterView(viewModel: informationChapterViewModel, reachedLastChapterFlag: $canStartSimulation)
                        .frame(width: proxy.size.width * 0.45)
                        .padding(.top, proxy.size.width / proxy.size.height * 30)
                        .padding(.bottom, 15)
                        .padding(.horizontal, 40)
                    
                    VStack {
                        ScrollView(.vertical, showsIndicators: true) {
                            LazyVStack(alignment: .leading) {
                                ForEach(listItemModels) { model in
                                    DescriptionListItemView(model: model)
                                        .padding(.leading, 5)
                                }
                            }
                        }

                        Button {
                            showOnboarding = false
                        } label: {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 270, height: 90)
                                .foregroundColor(canStartSimulation ? .green : .gray)
                                .overlay {
                                    Image(systemName: "play.fill")
                                        .font(.system(size: 55, weight: .bold))
                                        .foregroundColor(.white)
                                }
                        }
                        .padding(.top, 60)
                        .disabled(!canStartSimulation)
                    }
                    .padding(.horizontal)
                    .padding(.top, proxy.size.width / proxy.size.height * 20)
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .alert(isPresented: $showScrollTextAlert) {
                Alert(
                    title: Text("Scrollable Text"),
                    message: Text("Smaller screens probably will not show all the text on the left panel. In this case, you may scroll up or down to see more information!")
                )
            }
        }
    }
}
