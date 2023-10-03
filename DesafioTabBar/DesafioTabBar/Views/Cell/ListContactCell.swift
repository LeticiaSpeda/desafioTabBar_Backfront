import UIKit

final class ListContactCell: UITableViewCell {
    static let identifier = String(describing: ListContactCell.self)
    
    private lazy var mainHStackView = UIStackViewControllerCuston.init(orientation: .horizontal, spaceComponents: 8)
    
    private lazy var photoView = UIViewCuston()
    
    private lazy var photoContactImage: UIImageView = {
        let imgView = UIImageView(image: UIImage.teste)
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 80 / 2
        imgView.contentMode = .scaleAspectFill
        imgView.translate()
        return imgView
    }()
    
    private lazy var nameContactLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    func setupCell(profile: Profile) {
        nameContactLabel.text = profile.name
        photoContactImage.image = profile.photo
    }
    
    private func configureHierarchy() {
        addSubview(mainHStackView)
        
        mainHStackView.addArrangedSubview(photoView)
        mainHStackView.addArrangedSubview(photoContactImage)
        
        mainHStackView.addArrangedSubview(nameContactLabel)
        mainHStackView.addArrangedSubview(UIView())
        
        photoView.addSubview(photoContactImage)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            mainHStackView.topAnchor.constraint(
                equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10
            ),
            mainHStackView.leadingAnchor.constraint(
                equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10
            ),
            mainHStackView.trailingAnchor.constraint(
                equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10
            ),
            mainHStackView.bottomAnchor.constraint(
                equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10
            ),
            
            photoView.widthAnchor.constraint(equalToConstant: 80),
            
            
            photoContactImage.widthAnchor.constraint(equalToConstant: 80),
            photoContactImage.topAnchor.constraint(equalTo: photoView.topAnchor),
            photoContactImage.bottomAnchor.constraint(equalTo: photoView.bottomAnchor),
            
            contentView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configureStyle() {
        backgroundColor = .white
        selectionStyle = .none
    }
}
