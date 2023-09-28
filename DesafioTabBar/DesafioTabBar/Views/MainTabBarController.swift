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
        
        let phone = ContatsViewController()
        phone.tabBarItem.image = UIImage(systemName: "phone")
        
        self.setViewControllers([person,phone], animated: true)
    }
}

