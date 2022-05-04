import GameplayKit

class PheromoneManager {

    private var shader: SKShader {
        SKShader(source:
            """
            void main() {
                vec4 color = texture2D(u_texture, v_tex_coord);
            
                gl_FragColor = vec4(color.rgb, color.a) - \(alphaValue * 2) ;
            }
            """
        )
    }
    
    private var alphaValue: Double = SimulationSettings.decayValue
    
    private let view: SKView
    
    private var bufferNode = SKSpriteNode()
    
    private var pheromoneCache = Array<Pheromone>()
    
    private var bluePheromoneMap = Array<PheromoneDataModel>()
    
    private var redPheromoneMap = Array<PheromoneDataModel>()
    
    init(_ view: SKView) {
        self.view = view
        self.bufferNode = setupBufferNode()
        
        if let scene = view.scene {
            scene.addChild(bufferNode)
        } else {
            fatalError("[PheromoneManager] Could not initialize bufferNode on SKScene")
        }
    }
    
    func createPheromone(at position: CGPoint, for antState: Ant.AvailableStates) {
        switch antState {
        case .searchingFood:
            bluePheromoneMap.append(PheromoneDataModel(position))
            pheromoneCache.append(Pheromone(.blue, at: position))
            
        case .returningFood:
            redPheromoneMap.append(PheromoneDataModel(position))
            pheromoneCache.append(Pheromone(.red, at: position))
        }
        
        bufferNode.addChild(pheromoneCache.last!)
    }
    
    func update(deltaTime seconds: TimeInterval) {
        
        for map in [bluePheromoneMap, redPheromoneMap] {
            for pheromone in map {
                pheromone.update(seconds: seconds)
            }
        }
        
        bluePheromoneMap.removeAll { pheromone in
            pheromone.shouldRemove
        }
        
        redPheromoneMap.removeAll { pheromone in
            pheromone.shouldRemove
        }
    }
    
    func updateTexturesFromCache() {
        // Get the texture from all child nodes
        guard let texture = view.texture(from: bufferNode) else {
            fatalError("Failed to retrieve texture from bufferNode.")
        }

        if alphaValue != SimulationSettings.decayValue {
            alphaValue = SimulationSettings.decayValue
            bufferNode.shader = shader
        }
        
        bufferNode.run(.setTexture(texture, resize: true))
        
        // Remove all Pheromones from screen
        for pheromone in pheromoneCache {
            pheromone.removeFromParent()
        }
        
        // Clear cache
        pheromoneCache.removeAll()
    }
    
    public func getPheromones(in rect: DetectionRectangle, for state: Ant.AvailableStates) -> [PheromoneDataModel] {
        if state == .searchingFood {
            return redPheromoneMap.filter { pheromone in
                rect.contains(pheromone.position)
            }
        } else {
            return bluePheromoneMap.filter { pheromone in
                rect.contains(pheromone.position)
            }
        }
    }
    
}

extension PheromoneManager {
    class PheromoneDataModel {
        var position: CGPoint
        var alpha: Double = 1
        let lifeTime: Double = 4
        var deltaTime: Double
        
        var shouldRemove: Bool {
            alpha <= 0.05
        }
        
        init(_ position: CGPoint) {
            self.position = position
            deltaTime = lifeTime
        }
        
        func update(seconds: TimeInterval) {
            deltaTime = deltaTime - seconds
            self.alpha = deltaTime / lifeTime
        }
    }
}

extension PheromoneManager {
    
    private func setupBufferNode() -> SKSpriteNode {
        
        let bufferNode = SKSpriteNode()
        
        bufferNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        bufferNode.position = CGPoint(x: 0, y: 00)
        
        bufferNode.shader = shader
        
        let p1 = SKShapeNode(circleOfRadius: 5)
        p1.strokeColor = .black
        p1.position = CGPoint(x: 0, y: 0)
        
        let p2 = SKShapeNode(circleOfRadius: 5)
        p2.strokeColor = .black
        p2.position = CGPoint(x: 0, y: SimulationSettings.bounds.height)
        
        let p3 = SKShapeNode(circleOfRadius: 5)
        p3.strokeColor = .black
        p3.position = CGPoint(x: SimulationSettings.bounds.width, y: SimulationSettings.bounds.height)
        
        let p4 = SKShapeNode(circleOfRadius: 5)
        p4.strokeColor = .black
        p4.position = CGPoint(x: SimulationSettings.bounds.width, y: 0)
        
        bufferNode.addChild(p1)
        bufferNode.addChild(p2)
        bufferNode.addChild(p3)
        bufferNode.addChild(p4)
        
        return bufferNode
    }
}
