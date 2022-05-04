import CoreGraphics

extension CGPoint {
    
    var magnitude: Double {
        return (powX() + powY()).squareRoot()
    }
    
    // Returns a CGPoint which magnitude equals 1.
    var normalized: Self {
        return self / magnitude
    }
    
    static func -(_ pointA: CGPoint, _ pointB: CGPoint) -> Self {
        return CGPoint(x: pointB.x - pointA.x, y: pointB.y - pointA.y)
    }
    
    static func +(_ pointA: CGPoint, _ pointB: CGPoint) -> Self {
        return CGPoint(x: pointA.x + pointB.x, y: pointA.y + pointB.y)
    }
    
    static func *(_ pointA: CGPoint, _ pointB: CGPoint) -> Self {
        return CGPoint(x: pointA.x * pointB.x, y: pointA.y * pointB.x)
    }
    
    static func *(_ point: CGPoint, _ value: Double) -> Self {
        return CGPoint(x: point.x * value, y: point.y * value)
    }
    
    static func /(_ point: CGPoint, _ value: Double) -> Self {
        return CGPoint(x: point.x / value, y: point.y / value)
    }
    
    static func +=(_ pointA: inout CGPoint, _ pointB: CGPoint) {
        pointA = pointA + pointB
    }
    
    func powX() -> Double {
        return x * x
    }
    
    func powY() -> Double {
        return y * y
    }
    
}
