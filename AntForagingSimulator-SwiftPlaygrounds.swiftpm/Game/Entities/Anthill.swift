import SpriteKit

class Anthill: SKShapeNode {

    private var qntFoodCollected: Int = 0
    
    private var label: SKLabelNode!
    
    override init() {
        super.init()
    }
    
    convenience init(at position: CGPoint) {
        self.init()
        self.init(circleOfRadius: SimulationSettings.antHillRadius)
        
        fillColor = .brown
        
        strokeColor = .white
        
        blendMode = .replace
        
        self.position = position
        
        self.zPosition = 3
        
        self.physicsBody = PhysicsComponent(.anthill).getBody()
        
        self.label = SKLabelNode(text: "\(qntFoodCollected)")
        
        label.fontSize = SimulationSettings.antHillFontSize
        
        label.fontName = "SFPro"
        
        label.fontColor = .white
        
        label.position = CGPoint(x: 0, y: -(label.fontSize * 0.22) * SimulationSettings.aspectRatio)
        
        label.zPosition = 4
        
        addChild(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func handleFood() {
        qntFoodCollected += 1
        label.text = "\(qntFoodCollected)"
    }
    
}
