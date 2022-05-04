import SpriteKit

class PhysicsComponent {
    
    enum BodyType {
        case ant
        case food
        case anthill
    }
    
    private var physicsBody: SKPhysicsBody
    
    init(_ type: BodyType) {
        switch type {
        case .ant:
            physicsBody = SKPhysicsBody(circleOfRadius: 9)
            physicsBody.categoryBitMask = 0x000001 << 0
            physicsBody.contactTestBitMask = 0x000001 << 2
            
        case .food:
            physicsBody = SKPhysicsBody(circleOfRadius: 4)
            physicsBody.categoryBitMask = 0x000001 << 1
            physicsBody.contactTestBitMask = 0x000001 << 0
        
        case .anthill:
            physicsBody = SKPhysicsBody(circleOfRadius: SimulationSettings.antHillRadius * 1.2)
            physicsBody.categoryBitMask = 0x000001 << 2
        }
        
        physicsBody.affectedByGravity = false
        physicsBody.collisionBitMask = 0
        
    }
    
    func getBody() -> SKPhysicsBody {
        return self.physicsBody
    }
}
