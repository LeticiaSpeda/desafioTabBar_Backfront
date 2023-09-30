import UIKit

final class ListContactCell: UITableViewCell {
    static let identifier = String(describing: ListContactCell.self)
    
    private lazy var mainHStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.translate()
        return stack
    }()
    
    private lazy var photoView: UIView = {
        let view = UIView()
        view.translate()
        return view
    }()
    
    private lazy var photoContactImage: UIImageView = {
        let imgView = UIImageView(image: UIImage.teste)
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 100 / 2
        imgView.contentMode = .scaleAspectFill
        imgView.translate()
        return imgView
    }()
    
    private lazy var nameContactLabel: UILabel = {
        let label = UILabel()
        label.text = "Leticia"
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
    
    private func configureHierarchy() {
        addSubview(mainHStackView)
        
        mainHStackView.addArrangedSubview(photoView)
        mainHStackView.addArrangedSubview(photoContactImage)
        
        mainHStackView.addArrangedSubview(nameContactLabel)
        
        
        photoView.addSubview(photoContactImage)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            mainHStackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            mainHStackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            mainHStackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            mainHStackView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            
//            photoView.heightAnchor.constraint(equalToConstant: 90),
            photoView.widthAnchor.constraint(equalToConstant: 100),
            
            
//            photoContactImage.heightAnchor.constraint(equalToConstant: 90),
            photoContactImage.widthAnchor.constraint(equalToConstant: 100),
            photoContactImage.topAnchor.constraint(equalTo: photoView.topAnchor),
            photoContactImage.bottomAnchor.constraint(equalTo: photoView.bottomAnchor),
            
            contentView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configureStyle() {
        backgroundColor = .white
    }
}
