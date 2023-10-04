import UIKit

enum TypeImageSelectd {
    case camera
    case library
    case cancel
}

final class AlertController: NSObject {
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
        super.init()
    }
    
    func choseImage(completion: @escaping (_ option: TypeImageSelectd) -> Void) {
        
        let alertController = UIAlertController(
            title: "Selecione uma das opções abaixo",
            message: nil, preferredStyle: .actionSheet
        )
        
        let camera = UIAlertAction(title: "camêra", style: .default) { (action) in
            completion(.camera)
        }
        
        let library = UIAlertAction(title: "biblioteca", style: .default) { (action) in
            completion(.library)
        }
        
        let cancel = UIAlertAction(title: "cancelar", style: .default) { (action) in
            completion(.cancel)
        }
        
        alertController.addAction(camera)
        alertController.addAction(library)
        alertController.addAction(cancel)
        controller.present(alertController, animated: true)
    }
    
    func alertInformation(title: String, message: String) {
        let alertController: UIAlertController = UIAlertController(
            title: title,
            message: message
            , preferredStyle: .alert
        )
        
        let ok = UIAlertAction(title: "Ok", style: . default)
        alertController.addAction(ok)
        controller.present(alertController, animated: true)
    }
}
