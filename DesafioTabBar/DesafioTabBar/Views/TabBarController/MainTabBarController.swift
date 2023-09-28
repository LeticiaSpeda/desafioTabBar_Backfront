import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureStyle()
    }

    private func configureStyle() {
        tabBar.backgroundColor = .white
    
        let person = PersonViewController()
        person.tabBarItem.image = UIImage(systemName: "person")
        person.tabBarItem.title = "Person"
        
        let phone = ContatsViewController()
        phone.tabBarItem.image = UIImage(systemName: "phone")
        phone.tabBarItem.title = "Phone"
        
        let trash = TrashViewController()
        trash.tabBarItem.image = UIImage(systemName: "trash")
        trash.tabBarItem.title = "Trash"
        
        self.setViewControllers([person, phone, trash], animated: true)
    }
}

