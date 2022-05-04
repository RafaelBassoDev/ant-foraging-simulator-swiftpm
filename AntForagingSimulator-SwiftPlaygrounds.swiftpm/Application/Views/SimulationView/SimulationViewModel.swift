import SpriteKit

class SimulationViewModel: ObservableObject {
    
    @Published var numberOfAnts: Double = SimulationSettings.numberOfAnts
    
    @Published var antWanderStrength: Double = SimulationSettings.antWanderStrength
    
    @Published var antSpeed: Double = SimulationSettings.AntMaximumSpeed
    
    @Published var antTargetingInterval: Double = SimulationSettings.AntTargetPointInterval
    
    @Published var pheromoneDecayTime: Double = SimulationSettings.decayValue
    
    @Published var pheromoneDepositInterval: Double = SimulationSettings.depositInterval
    
    @Published var showMenu: Bool = false
    
    let scene: SKScene
    
    init() {
        scene = GameScene()
        scene.backgroundColor = .black
        scene.scaleMode = .aspectFit
    }
    
    public func getScene(with size: CGSize) -> SKScene {
        scene.size = size
        SimulationSettings.bounds = size
        return scene
    }
    
    func saveSettings() {
        SimulationSettings.numberOfAnts = numberOfAnts
        
        SimulationSettings.antWanderStrength = antWanderStrength
        
        SimulationSettings.AntMaximumSpeed = antSpeed
        
        SimulationSettings.AntTargetPointInterval = antTargetingInterval
        
        SimulationSettings.decayValue = pheromoneDecayTime
        
        SimulationSettings.depositInterval = pheromoneDepositInterval
        
        showMenu = false
    }
    
    func resetSettings() {
        SimulationSettings.resetSettings()
        
        numberOfAnts = SimulationSettings.numberOfAnts
        
        antWanderStrength = SimulationSettings.antWanderStrength
        
        antSpeed = SimulationSettings.AntMaximumSpeed
        
        antTargetingInterval = SimulationSettings.AntTargetPointInterval
        
        pheromoneDecayTime = SimulationSettings.decayValue
        
        pheromoneDepositInterval = SimulationSettings.depositInterval
    }
    
}
