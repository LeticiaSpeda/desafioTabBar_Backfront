import UIKit

final class PersonViewController: UIViewController, UITextFieldDelegate {
    
    var data: [Profile] = []
    
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
        let imgView = UIImageView(image: UIImage.user)
        imgView.contentMode = .scaleAspectFill
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 150 / 2
        imgView.translate()
        return imgView
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
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(
            string: "Digite seu nome",
            attributes: [.foregroundColor: UIColor.black]
        )
        textField.delegate = self
        textField.textColor = .black
        textField.layer.cornerRadius = 6
        textField.keyboardAppearance = .default
        textField.returnKeyType = .done
        textField.translate()
        return textField
    }()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextFiel.resignFirstResponder()
        return true
        
    }
    
    private lazy var selectImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Editar Foto", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return button
    }()
    
    private lazy var addImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Adicionar", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return button
    }()
    
    private lazy var imagePicker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.delegate = self
        return picker
    }()
    
    private lazy var listContactsTableView : UITableView = {
        let table = UITableView()
        table.register(
            ListContactCell.self,
            forCellReuseIdentifier: ListContactCell.identifier
        )
        table.backgroundColor = .white
        table.delegate = self
        table.dataSource = self
        table.translate()
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    @objc func handleImageContact() {
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true)
    }
    
    @objc func handleAddImage() {
        data.append(Profile(name: nameTextFiel.text ?? "", photo: userPhotoImage.image ?? UIImage()))
        
        listContactsTableView.reloadData()
    }
    
    private func commonInit() {
        configureActions()
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureActions() {
        selectImageButton.addTarget(self, action: #selector(handleImageContact), for: .touchUpInside)
        
        addImageButton.addTarget(self, action: #selector(handleAddImage), for: .touchUpInside)
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
            informationsView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            informationsView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor
            ),
            informationsView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor
            ),
            informationsView.heightAnchor.constraint(equalToConstant: 400),
            informationsView.bottomAnchor.constraint(
                equalTo: mainVStackView.bottomAnchor
            ),
            
            mainVStackView.topAnchor.constraint(
                equalTo: informationsView.topAnchor,
                constant: 10
            ),
            mainVStackView.leadingAnchor.constraint(
                equalTo: informationsView.leadingAnchor,
                constant: 10
            ),
            mainVStackView.trailingAnchor.constraint(
                equalTo: informationsView.trailingAnchor,
                constant: -10
            ),
            
            photoView.heightAnchor.constraint(equalToConstant: 150),
            
            userPhotoImage.centerXAnchor.constraint(
                equalTo: photoView.centerXAnchor
            ),
            userPhotoImage.heightAnchor.constraint(equalToConstant: 150),
            userPhotoImage.widthAnchor.constraint(equalToConstant: 150),
            
            nameTextFiel.heightAnchor.constraint(equalToConstant: 28),
            
            mainTableVStackView.topAnchor.constraint(
                equalTo: informationsView.bottomAnchor
            ),
            mainTableVStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor
            ),
            mainTableVStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor
            ),
            mainTableVStackView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
        ])
    }
    
    private func configureStyle() {
        view.backgroundColor = #colorLiteral(red: 0.7312184343, green: 0.7312184343, blue: 0.7312184343, alpha: 1)
    }
}

extension PersonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ListContactCell()
        cell.setupCell(profile: data[indexPath.row])
        
        return cell
    }
    
}

extension PersonViewController: UIImagePickerControllerDelegate,  UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.userPhotoImage.image = image
        }
        
        picker.dismiss(animated: true)
    }
}
