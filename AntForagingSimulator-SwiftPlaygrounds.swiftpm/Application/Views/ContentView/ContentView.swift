import SwiftUI

struct ContentView: View {
    
    @State var showOnboarding: Bool = true
    
    var body: some View {
        
        if showOnboarding {
            OnboardingView(showOnboarding: $showOnboarding, listItemModels: OnboardingViewDataSource.defaultListItemModels)
        } else {
            SimulationView()
        }
    }
}
