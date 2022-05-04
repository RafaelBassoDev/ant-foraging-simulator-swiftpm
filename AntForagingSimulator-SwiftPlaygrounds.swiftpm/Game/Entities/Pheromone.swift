import SpriteKit

class Pheromone: SKSpriteNode {
    
    enum PheromoneType {
        case red, blue
    }
    
    private var type: PheromoneType
    
    init(_ type: PheromoneType, at position: CGPoint) {
        
        self.type = type
        
        let textureKey: TextureManager.AvailableTextureKey = type == .red ? .pheromone_red : .pheromone_blue

        super.init(texture: TextureManager.getTexture(textureKey), color: .clear, size: TextureManager.getTexture(textureKey).size())
        
        self.position = position
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
