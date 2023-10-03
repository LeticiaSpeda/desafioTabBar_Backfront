import UIKit

final class UIViewCuston: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStyle() {
        translate()
    }
}
