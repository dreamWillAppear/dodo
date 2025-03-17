import UIKit

protocol CoordinatorProtocol {
    var children: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}


final class MainCoordinator: CoordinatorProtocol {
    
    var children: [CoordinatorProtocol] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let catalogViewController = CatalogViewController()
        navigationController.pushViewController(catalogViewController, animated: false)
    }
    
}
