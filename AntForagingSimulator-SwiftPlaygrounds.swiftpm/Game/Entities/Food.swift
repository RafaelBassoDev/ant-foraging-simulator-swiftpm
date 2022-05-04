import SpriteKit

class Food: SKSpriteNode {
    
    init(at position: CGPoint) {
        super.init(texture: TextureManager.getTexture(.food), color: .clear, size: TextureManager.getTexture(.food).size())
        
        self.position = position
        
        self.zPosition = 2
        
        self.physicsBody = PhysicsComponent(.food).getBody()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
