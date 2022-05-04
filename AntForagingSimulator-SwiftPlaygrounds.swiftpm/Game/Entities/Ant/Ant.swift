import SpriteKit

class Ant: SKSpriteNode {
    
    public var state: AvailableStates = .searchingFood
    
    private var movementComponent: MovementComponent!
    
    private var detectionRectangle: DetectionRectangle!
    
    private var leftSensor: Sensor!
    private var middleSensor: Sensor!
    private var rightSensor: Sensor!
    
    public var canChangeTarget: Bool {
        movementComponent.getCurrentState() != .movingToTarget
    }
    
    init(position: CGPoint) {
        super.init(texture: TextureManager.getTexture(.ant_blue), color: .clear, size: TextureManager.getTexture(.ant_blue).size())
        
        movementComponent = MovementComponent(self)
        
        self.position = position
        
        zPosition = 1
        
        constraints = [
            .positionX(.init(lowerLimit: SimulationSettings.bounds.width * 0.10, upperLimit: SimulationSettings.bounds.width * 0.9),
                       y: .init(lowerLimit: 0, upperLimit: SimulationSettings.bounds.height))
        ]
        
        physicsBody = PhysicsComponent(.ant).getBody()

        detectionRectangle = DetectionRectangle(a: CGPoint(x: 0, y: 12),
                                                b: CGPoint(x: 0, y: -12),
                                                c: CGPoint(x: 16, y: -12),
                                                d: CGPoint(x: 16, y: 12))
        
        middleSensor = Sensor(at: CGPoint(x: 12, y: 0), radius: 4)

        leftSensor = Sensor(at: CGPoint(x: 4, y: 8), radius: 4)
        
        rightSensor = Sensor(at: CGPoint(x: 4, y: -8), radius: 4)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func changeTexture(to key: TextureManager.AvailableTextureKey) {
        texture = TextureManager.getTexture(key)
    }
    
    public func update(deltaTime seconds: TimeInterval) {
        movementComponent.update(deltaTime: seconds)
    }
    
    public func handleSensors(_ manager: PheromoneManager) {
        middleSensor.position = convert(CGPoint(x: 12, y: 0), to: scene!)
        leftSensor.position = convert(CGPoint(x: 4, y: 8), to: scene!)
        rightSensor.position = convert(CGPoint(x: 4, y: -8), to: scene!)
        
        // get rectangular area in front of Ant
        let mappedPheromones = manager.getPheromones(in: DetectionRectangle(a: convert(detectionRectangle.a, to: scene!),
                                                                            b: convert(detectionRectangle.b, to: scene!),
                                                                            c: convert(detectionRectangle.c, to: scene!),
                                                                            d: convert(detectionRectangle.d, to: scene!)), for: state)
        
        update(sensor: middleSensor, with: mappedPheromones)
        update(sensor: leftSensor, with: mappedPheromones)
        update(sensor: rightSensor, with: mappedPheromones)
        
        if middleSensor.strength > leftSensor.strength && middleSensor.strength > rightSensor.strength {
            changeDirectionTo(middleSensor.position)
            
        } else if leftSensor.strength > rightSensor.strength {
            changeDirectionTo(leftSensor.position)
            
        } else if rightSensor.strength > leftSensor.strength {
            changeDirectionTo(rightSensor.position)
        }
    }
    
    private func update(sensor: Sensor, with pheromones: [PheromoneManager.PheromoneDataModel]) {
        sensor.strength = 0

        for pheromone in pheromones {
            if sensor.contains(pheromone) {
                sensor.strength += pheromone.alpha
            }
        }
    }
}

extension Ant {
    enum AvailableStates {
        case searchingFood
        case returningFood
    }
    
    public func updateState(to nextState: AvailableStates) {
        if state != nextState {
            self.state = nextState
            
            switch nextState {
            case .searchingFood:
                changeTexture(to: .ant_blue)
            case .returningFood:
                changeTexture(to: .ant_red)
                break
            }
        }
    }
    
    func changeDirectionTo(_ target: CGPoint) {
        movementComponent.move(to: target)
    }
    
    public func handleFood(completion: (_ currentState: AvailableStates) -> Void) {
        
        completion(self.state)
        
        updateState(to: .returningFood)
    }
}
