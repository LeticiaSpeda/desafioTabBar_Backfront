import UIKit

final class UIButtonCuston: UIButton {
    
    var titleButton: String
    var colorButton: UIColor
    var fontButton: UIFont
 
    init(titleButton: String, colorButton: UIColor, fontButton: UIFont) {
        self.titleButton = titleButton
        self.colorButton = colorButton
        self.fontButton = fontButton
        super.init(frame: .zero)
        configureStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStyle() {
        setTitle(titleButton, for: .normal)
        setTitleColor(colorButton, for: .normal)
        titleLabel?.font = fontButton
        translate()
    }
}
