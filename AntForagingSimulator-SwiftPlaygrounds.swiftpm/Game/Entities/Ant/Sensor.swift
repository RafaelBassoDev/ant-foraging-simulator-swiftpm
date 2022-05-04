import SpriteKit

class Sensor {
    let radius: Double
    var position: CGPoint
    var strength: Double
    
    init(at position: CGPoint, radius: Double) {
        self.radius = radius
        self.position = position
        self.strength = 0
        
        self.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func contains(_ pheromone: PheromoneManager.PheromoneDataModel) -> Bool {
        if pow(pheromone.position.x - position.x, 2) + pow(pheromone.position.y - position.y, 2) < pow(radius, 2) {
            return true
        }
        return false
    }
}
