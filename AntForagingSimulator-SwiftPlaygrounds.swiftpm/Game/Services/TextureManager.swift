import SpriteKit

class TextureManager {
    
    enum AvailableTextureKey {
        case ant_blue
        case ant_red
        case food
        case pheromone_red
        case pheromone_blue
    }
    
    private struct AvailableTextures {
        let textures: Dictionary<AvailableTextureKey, SKTexture> = [
            .ant_blue      : SKTexture(imageNamed: "ant_blue"),
            .ant_red       : SKTexture(imageNamed: "ant_red"),
            .food          : SKTexture(imageNamed: "food"),
            .pheromone_red : SKTexture(imageNamed: "pheromone_red"),
            .pheromone_blue: SKTexture(imageNamed: "pheromone_blue")
        ]
        
        init() {
            for (_, texture) in textures {
                texture.preload { }
            }
        }
        
        subscript(key: AvailableTextureKey) -> SKTexture {
            return textures[key]!
        }
    }
    
    static private let availableTextures = AvailableTextures()
    
    static func getTexture(_ key: AvailableTextureKey) -> SKTexture {
        availableTextures[key]
    }
}
