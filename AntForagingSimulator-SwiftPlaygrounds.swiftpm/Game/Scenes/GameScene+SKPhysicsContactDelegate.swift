import SpriteKit

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        guard let bodyA = contact.bodyA.node,
              let bodyB = contact.bodyB.node else { return }

        guard let ant: Ant = bodyA.isMember(of: Ant.self) ? (bodyA as! Ant) : nil else { return }

        if bodyB.isMember(of: Food.self) {
            ant.handleFood { currentState in
                if currentState == .searchingFood {
                    bodyB.removeFromParent()
                    availableFoodAmount += 1
                    ant.changeDirectionTo(ant.position * -1)
                }
            }
        }
        
        if bodyB.isMember(of: Anthill.self) {
            if ant.state == .returningFood {
                self.antHill.handleFood()
                ant.updateState(to: .searchingFood)
                ant.changeDirectionTo(ant.position * -1)
            }
        }
    }
}
