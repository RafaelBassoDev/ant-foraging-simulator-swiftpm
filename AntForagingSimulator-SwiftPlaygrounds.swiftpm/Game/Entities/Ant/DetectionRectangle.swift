import SpriteKit

struct DetectionRectangle {
    let a: CGPoint
    let b: CGPoint
    let c: CGPoint
    let d: CGPoint
    
    public func contains(_ point: CGPoint) -> Bool {
        let AB = a - b
        let AP = a - point
        let BC = b - c
        let BP = b - point
        let ABAP = product(AB, AP)
        let ABAB = product(AB, AB)
        let BCBP = product(BC, BP)
        let BCBC = product(BC, BC)
        return 0 <= ABAP && ABAP <= ABAB && 0 <= BCBP && BCBP <= BCBC
    }
    
    private func product(_ pointA: CGPoint, _ pointB: CGPoint) -> Double {
        return pointA.x * pointB.x + pointA.y * pointB.y
    }
}
