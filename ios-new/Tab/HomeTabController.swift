import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewControllers = TabEnum.allCases.map { tab -> UINavigationController in
            let viewController: UIViewController
            switch tab {
            case .main:
                viewController = HomeController()
                viewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 1)
            case .media:
                viewController = MediaViewController()
                viewController.tabBarItem = UITabBarItem(title: "Media", image: UIImage(systemName: "play.rectangle.fill"), tag: 2)
            case .quran:
                viewController = QuranViewController()
                viewController.tabBarItem = UITabBarItem(title: "Quran", image: UIImage(systemName: "gearshape.fill"), tag: 3)
            case .library:
                viewController = LibraryViewController()
                viewController.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "books.vertical.fill"), tag: 4)
            case .profile:
                viewController = ProfileViewController()
                viewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 5)
            }
            return UINavigationController(rootViewController: viewController)
        }
        
        self.setViewControllers(viewControllers, animated: true)
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
    }
}
