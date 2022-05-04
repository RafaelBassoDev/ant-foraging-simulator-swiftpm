import SpriteKit

class MovementComponent {
    
    enum MovementState {
        case wandering
        case turningRight, turningLeft
        case turningDown, turningUp
        case movingToTarget
    }
    
    private var state: MovementState
    
    private var movementDirection: CGPoint
    
    private var velocity: CGPoint
    
    private let referenceNode: SKNode
    
    
    // Ant is chasing a point
    private var targetPointDirection: CGPoint = .zero
    
    private var targetPointTimer: Double = 0
    
    
    // Avoid wall variables
    private let windowSize: CGSize = SimulationSettings.bounds
    
    private let viewTurnDistance: Double = 20

    private let turnTime: Double = 60

    private var turnElapsedTime: Double = 0.0

    private var isTurning: Bool = false
    
    
    init(_ node: SKNode) {
        referenceNode = node
        movementDirection = CGPoint.zero
        state = .wandering
        velocity = .zero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func getCurrentState() -> MovementState {
        self.state
    }
    
}

extension MovementComponent {
    
    private var targetDirection: CGPoint {
        get {
            switch state {
            case .wandering:
                return CGPoint(x: Double.random(in: -1...1), y: Double.random(in: -1...1))
            case .turningRight:
                return CGPoint(x: Double.random(in: 0...1), y: Double.random(in: -1...1))
            case .turningLeft:
                return CGPoint(x: Double.random(in: -1...0), y: Double.random(in: -1...1))
            case .turningDown:
                return CGPoint(x: Double.random(in: -1...1), y: Double.random(in: -1...0))
            case .turningUp:
                return CGPoint(x: Double.random(in: -1...1), y: Double.random(in: 0...1))
            case .movingToTarget:
                return targetPointDirection
            }
        }
    }
    
    public func move(to target: CGPoint) {
        targetPointDirection = (referenceNode.position - target).normalized
        state = .movingToTarget
        targetPointTimer = SimulationSettings.AntTargetPointInterval
    }
    
    func update(deltaTime seconds: TimeInterval) {
        
        if state == .movingToTarget {
            movementDirection = targetDirection

            if targetPointTimer > 0 {
                targetPointTimer -= seconds
            } else {
                state = .wandering
            }
            
        } else {
            movementDirection = (movementDirection + targetDirection  * SimulationSettings.antWanderStrength).normalized
            
            if turnElapsedTime > 0 {
                turnElapsedTime -= 0.5
            } else {
                isTurning = false
                state = .wandering
            }
            
            // Make the ants turn away from bounds
            if !isTurning {
                if referenceNode.position.x > windowSize.width * 0.80 - viewTurnDistance {
                    state = .turningLeft
                    turnElapsedTime = turnTime
                    isTurning = true
                } else if referenceNode.position.x < windowSize.width * 0.20 + viewTurnDistance {
                    state = .turningRight
                    turnElapsedTime = turnTime
                    isTurning = true
                }

                if referenceNode.position.y > windowSize.height * 0.80 - viewTurnDistance {
                    state = .turningDown
                    turnElapsedTime = turnTime
                    isTurning = true
                } else if referenceNode.position.y < windowSize.height * 0.20 + viewTurnDistance {
                    state = .turningUp
                    turnElapsedTime = turnTime
                    isTurning = true
                }
            }
        }
        
        velocity = movementDirection * SimulationSettings.AntMaximumSpeed * seconds
        
        referenceNode.position += velocity
        
        referenceNode.zRotation = atan2(velocity.y, velocity.x)
    }
}
