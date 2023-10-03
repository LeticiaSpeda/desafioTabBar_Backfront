import UIKit

final class UIStackViewControllerCuston: UIStackView {
    
    var orientation:  NSLayoutConstraint.Axis
    var spaceComponents: CGFloat
    
    init(orientation: NSLayoutConstraint.Axis, spaceComponents: CGFloat) {
        self.orientation = orientation
        self.spaceComponents = spaceComponents
        super.init(frame: .zero)
        configureStyle()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStyle() {
        axis = orientation
        spacing = spaceComponents
        translate()
    }
    
}
