import SpriteKit

class GameScene: SKScene {
    
    var ants = Array<Ant>()

    var antHill: Anthill!
    
    var pheromoneManager: PheromoneManager!
    
    var depositTimer: Double = 0.0
    
    
    var deltaTime: TimeInterval = 0
    
    var lastUpdateInterval: TimeInterval = 0
    
    
    var foodAmountLabel: SKLabelNode!
    
    var availableFoodAmount: Int = 30 {
        didSet {
            foodAmountLabel.text = "Available food: \(availableFoodAmount)"
        }
    }
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        pheromoneManager = PheromoneManager(view)
        
        // generate ants
        generateAnts()
        
        // add anthill
        antHill = Anthill(at: CGPoint(x: self.size.width * 0.5,
                                      y: self.size.height * 0.5))
        
        createFoodAmountLabel()
        
        addChild(antHill)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchLocation = touches.first?.location(in: self) else { return }
        
        if availableFoodAmount > 0 {
            var foodDepositAmount: Int
            
            repeat {
                foodDepositAmount = Int.random(in: 1...10)
            } while foodDepositAmount > availableFoodAmount

            generateFood(at: touchLocation, amount: foodDepositAmount, radius: Double.random(in: 15...30))
            availableFoodAmount -= foodDepositAmount
            
            foodAmountLabel.run(.sequence([.scale(to: 1.1, duration: 0.2), .scale(to: 1, duration: 0.2)]))
            
        } else {
            generateMaxFoodReachedWarning(at: touchLocation)
        }
    }
 
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        if lastUpdateInterval == 0 {
            lastUpdateInterval = currentTime
        }
        
        deltaTime = currentTime - lastUpdateInterval
        lastUpdateInterval = currentTime
        
        
        if depositTimer > 0 {
            depositTimer -= deltaTime
        } else {
            depositTimer = SimulationSettings.depositInterval
            
            for ant in ants {
                pheromoneManager.createPheromone(at: ant.position, for: ant.state)
            }
            
            pheromoneManager.updateTexturesFromCache()
            
        }
        
        pheromoneManager.update(deltaTime: deltaTime)
        
        for ant in ants {
            ant.update(deltaTime: deltaTime)
            ant.handleSensors(pheromoneManager)
        }
    }
}
