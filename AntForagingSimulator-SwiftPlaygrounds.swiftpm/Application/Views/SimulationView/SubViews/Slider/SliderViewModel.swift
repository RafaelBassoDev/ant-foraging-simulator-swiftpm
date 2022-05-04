import SwiftUI

class SliderViewModel {
    
    enum SliderViewOptions {
        case antWanderStrength
        case antSpeed
        case antTargetingInterval
        case pheromoneDecayTime
        case pheromoneDepositInterval
    }

    var title: String
    var range: ClosedRange<Double>
    var step: Double
    var specifier: String
    var description: String
    
    init(_ option: SliderViewOptions) {
        
        switch option {
        case .antWanderStrength:
            self.title = "Wander Strength"
            self.range = 0.05...1
            self.step = 0.05
            self.specifier = "%0.2f"
            self.description = "Affects how random is the movement of the ants. Closer to 1 means the ant will be more \"indecisive\"."
            
        case .antSpeed:
            self.title = "Ant Speed"
            self.range = 20...100
            self.step = 1
            self.specifier = "%0.0f"
            self.description = "Increase or decrease the speed of the ants."
            
        case .antTargetingInterval:
            self.title = "Ant Targeting Interval"
            self.range = 0.1...0.5
            self.step = 0.05
            self.specifier = "%0.2f"
            self.description = "Change the time it takes for an ant to be available to target another pheromone."
            
        case .pheromoneDecayTime:
            self.title = "Pheromone Decay Value"
            self.range = 0.007...0.02
            self.step = 0.001
            self.specifier = "%0.3f"
            self.description = "Increase or decrease how much the pheromone will evaporate per frame update."
            
        case .pheromoneDepositInterval:
            self.title = "Pheromone Deposit Interval"
            self.range = 0.1...0.5
            self.step = 0.05
            self.specifier = "%0.2f"
            self.description = "Increase or decrease the time it takes for an ant to leave a pheromone behind while walking."
        }
    }
}
