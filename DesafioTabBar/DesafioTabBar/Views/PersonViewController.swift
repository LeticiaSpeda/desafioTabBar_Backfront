import UIKit

final class PersonViewController: UIViewController, UITextFieldDelegate {
    
    var data: [Profile] = []
    var alert: AlertController?
    
    private lazy var informationsView = UIViewCuston()
    
    private lazy var photoView = UIViewCuston()
    
    private lazy var mainVStackView = UIStackViewControllerCuston.init(
        orientation: .vertical,
        spaceComponents: 10
    )
    
    private lazy var mainTableVStackView = UIStackViewControllerCuston.init(
        orientation: .vertical,
        spaceComponents: 0
    )
    
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
    
    private lazy var selectImageButton = UIButtonCuston(
        titleButton: "Editar Foto",
        colorButton: .blue,
        fontButton: .boldSystemFont(ofSize: 16))
    
    private lazy var addImageButton = UIButtonCuston(
        titleButton: "Adicionar",
        colorButton: .blue,
        fontButton: .boldSystemFont(ofSize: 16)
    )
    
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
        alert = AlertController(controller: self)
        commonInit()
    }
    
    @objc func handleImageContact() {
        self.alert?.choseImage(completion: { option in
            switch option {
            case .camera:
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    self.imagePicker.sourceType = .camera
                } else {
                    self.imagePicker.sourceType = .photoLibrary
                }
                self.present(self.imagePicker, animated: true)
                
            case .library:
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true)
                
            case .cancel:
                break
            }
        })
    }
    
    @objc func handleAddImage() {
        if nameTextFiel.text == "" {
            self.alert?.alertInformation(
                title: "Atenção",
                message: "Por favor informe o nome antes de adicionar"
            )
        } else {
            data.append(
                Profile(
                    name: nameTextFiel.text ?? "",
                    photo: userPhotoImage.image ?? UIImage()
                )
            )
            listContactsTableView.reloadData()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextFiel.resignFirstResponder()
        return true
    }
    
    private func commonInit() {
        configureActions()
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureActions() {
        selectImageButton.addTarget(
            self,
            action: #selector(handleImageContact),
            for: .touchUpInside)
        
        addImageButton.addTarget(
            self,
            action: #selector(handleAddImage),
            for: .touchUpInside
        )
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
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        return data.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        let cell = ListContactCell()
        cell.setupCell(profile: data[indexPath.row])
        
        return cell
    }
}

extension PersonViewController: UIImagePickerControllerDelegate,  UINavigationControllerDelegate {
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.userPhotoImage.image = image
        }
        
        picker.dismiss(animated: true)
    }
}
