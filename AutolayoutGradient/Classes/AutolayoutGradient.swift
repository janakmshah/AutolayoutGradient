import UIKit

open class GradientView: UIView {

    public override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

}

public extension UIView {
    func applyGradient(_ colorLocations: [(UIColor, Double)]) {
        if let layer = self.layer as? CAGradientLayer {
            layer.colors = colorLocations.map{ $0.0.cgColor }
            layer.locations = colorLocations.map{ NSNumber(floatLiteral: $0.1) }
        } else {
            debugPrint("⚠️ Color gradient requires a layer of type: CAGradientLayer")
        }
    }
}
