import UIKit

final class PersonViewController: UIViewController {
    
    private lazy var informationsView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray.withAlphaComponent(0.4)
        view.translate()
        return view
    }()
    
    private lazy var mainVStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
//        stack.backgroundColor = .black
        stack.translate()
        return stack
    }()
    
    private lazy var userPhotoImage: UIImageView = {
        let image = UIImage.user
        let imgView = UIImageView(image: image)
        imgView.layer.masksToBounds = true
//        imgView.layer.cornerRadius = 60 / 2
        imgView.contentMode = .scaleAspectFit
        imgView.translate()
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureHierarchy() {
        view.addSubview(informationsView)
        
        informationsView.addSubview(mainVStackView)
        
//        mainVStackView.addArrangedSubview(UIView())
        mainVStackView.addArrangedSubview(userPhotoImage)
        mainVStackView.addArrangedSubview(UIView())
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            informationsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            informationsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            informationsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            informationsView.heightAnchor.constraint(equalToConstant: 400),
//            informationsView.bottomAnchor.constraint(equalTo: mainVStackView.bottomAnchor),
            
            mainVStackView.topAnchor.constraint(equalTo: informationsView.topAnchor, constant: 10),
            mainVStackView.leadingAnchor.constraint(equalTo: informationsView.leadingAnchor),
            mainVStackView.trailingAnchor.constraint(equalTo: informationsView.trailingAnchor),
            mainVStackView.bottomAnchor.constraint(equalTo: informationsView.bottomAnchor),
            
            userPhotoImage.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImage.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
    
    private func configureStyle() {
        view.backgroundColor = .white
    }
}
