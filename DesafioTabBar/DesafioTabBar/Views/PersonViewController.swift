import UIKit

final class PersonViewController: UIViewController {
    
    private lazy var informationsView: UIView = {
        let view = UIView()
        view.translate()
        return view
    }()
    
    private lazy var mainVStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translate()
        return stack
    }()
    
    private lazy var mainTableVStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translate()
        return stack
    }()
    
    private lazy var photoView: UIView = {
        let view = UIView()
        view.translate()
        return view
    }()
    
    private lazy var userPhotoImage: UIImageView = {
        let imgView = UIImageView(image: .teste)
        imgView.contentMode = .scaleAspectFit
        
        imgView.backgroundColor = .red
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 150 / 2
        imgView.translate()
        return imgView
    }()
    
    private lazy var selectImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Editar Foto", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var nameTextFiel: UITextField = {
        let label = UITextField()
        label.backgroundColor = .white
        label.attributedPlaceholder = NSAttributedString(string: "Digite seu nome", attributes: [.foregroundColor: UIColor.black])
        label.layer.cornerRadius = 6
        label.translate()
        return label
    }()
    
    private lazy var addImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Adicionar", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return button
    }()
    
    private lazy var listContactsTableView : UITableView = {
        let table = UITableView()
        table.register(ListContactCell.self, forCellReuseIdentifier: ListContactCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.translate()
        return table
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
        view.addSubview(mainTableVStackView)
        
        informationsView.addSubview(mainVStackView)
        
        photoView.addSubview(userPhotoImage)
        
        mainVStackView.addArrangedSubview(photoView)
        mainVStackView.addArrangedSubview(selectImageButton)
        mainVStackView.addArrangedSubview(nameLabel)
        mainVStackView.addArrangedSubview(nameTextFiel)
        mainVStackView.addArrangedSubview(UIView())
        mainVStackView.addArrangedSubview(addImageButton)
        mainVStackView.addArrangedSubview(UIView())
        
        
        mainTableVStackView.addArrangedSubview(listContactsTableView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            informationsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            informationsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            informationsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            informationsView.heightAnchor.constraint(equalToConstant: 400),
            informationsView.bottomAnchor.constraint(equalTo: mainVStackView.bottomAnchor),
            
            mainVStackView.topAnchor.constraint(equalTo: informationsView.topAnchor, constant: 10),
            mainVStackView.leadingAnchor.constraint(equalTo: informationsView.leadingAnchor, constant: 10),
            mainVStackView.trailingAnchor.constraint(equalTo: informationsView.trailingAnchor, constant: -10),
            
            photoView.heightAnchor.constraint(equalToConstant: 150),
            
            userPhotoImage.centerXAnchor.constraint(equalTo: photoView.centerXAnchor),
            userPhotoImage.heightAnchor.constraint(equalToConstant: 150),
            userPhotoImage.widthAnchor.constraint(equalToConstant: 150),
            
            nameTextFiel.heightAnchor.constraint(equalToConstant: 28),
            
            mainTableVStackView.topAnchor.constraint(equalTo: informationsView.bottomAnchor),
            mainTableVStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainTableVStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainTableVStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    private func configureStyle() {
        view.backgroundColor = #colorLiteral(red: 0.7312184343, green: 0.7312184343, blue: 0.7312184343, alpha: 1)
    }
}


extension PersonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return ListContactCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
}
