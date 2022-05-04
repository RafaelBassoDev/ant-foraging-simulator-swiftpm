import SpriteKit

class SimulationSettings {
    
    // Scene related settings
    public static var numberOfAnts: Double = 80
    
    // Bounds are initialized at ContentView viewModel
    public static var bounds = CGSize.zero
    
    public static var aspectRatio: Double {
        bounds.width / bounds.height
    }
    
    // Ant related settings
    public static var antWanderStrength: Double = 0.1
    
    public static var AntMaximumSpeed: Double = 50
    
    public static var AntTargetPointInterval: Double = 0.1
    
    
    // Pheromone related settings
    public static var decayValue: Double = 0.008
    
    public static var depositInterval: Double = 0.1
    
    // AntHill related settings
    public static let antHillRadius: Double = 25 * aspectRatio
    
    public static let antHillFontSize: Double = 20 * SimulationSettings.aspectRatio
    
    
    public static func resetSettings() {
        numberOfAnts = 80
        antWanderStrength = 0.1
        AntMaximumSpeed = 50
        AntTargetPointInterval = 0.1
        decayValue = 0.008
        depositInterval = 0.1
    }
}
