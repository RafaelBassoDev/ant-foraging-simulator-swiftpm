import SpriteKit

extension GameScene {
    
    func generateAnts() {
        let viewBounds = SimulationSettings.bounds
        
        for _ in 1...Int(SimulationSettings.numberOfAnts) {
            let ant = Ant(position: CGPoint(x: viewBounds.width / 2, y: viewBounds.height / 2))
            self.ants.append(ant)
            addChild(ant)
        }
    }
    
    func generateFood(at point: CGPoint, amount: Int, radius: Double) {
        for _ in 0...amount {
            var xPos: Double = 0
            var yPos: Double = 0

            while true {
                xPos = point.x + Double.random(in: -radius...radius)
                yPos = point.y + Double.random(in: -radius...radius)
                if sqrt(pow(xPos - point.x, 2) + pow(yPos - point.y, 2)) < radius {
                    addChild(Food(at: CGPoint(x: xPos, y: yPos)))
                    break
                }
            }
        }
    }
    
    func createFoodAmountLabel() {
        foodAmountLabel = SKLabelNode(text: "Available food: \(availableFoodAmount)")
        
        foodAmountLabel.fontName = "SFPro-Black"
        foodAmountLabel.fontSize = 30
        foodAmountLabel.fontColor = .white
        
        foodAmountLabel.position = CGPoint(x: frame.width * 0.5, y: frame.height - foodAmountLabel.frame.height - 30)
        
        foodAmountLabel.zPosition = 6
        
        addChild(foodAmountLabel)
    }
    
    func generateMaxFoodReachedWarning(at position: CGPoint) {
        let warningNode = SKLabelNode(text: "No more food available!")
        
        warningNode.fontName = "SFPro-Black"
        warningNode.fontSize = 22
        warningNode.fontColor = .white
        
        warningNode.position = position
        
        warningNode.zPosition = 5
        
        addChild(warningNode)
        
        let moveAndFade: SKAction = .group([.moveBy(x: 0, y: 50, duration: 2), .fadeOut(withDuration: 2)])
        
        warningNode.run(.sequence([moveAndFade, .removeFromParent()]))
    }
}
