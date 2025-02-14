import UIKit
import SnapKit

enum CatalogSection: Int, CaseIterable {
    case stories
    case products
}

final class CatalogViewController: UIViewController {
    
    private let productService = ProductService.shared
    
    private let stories = [
        UIImage(named: ImageName.defaultPizza)!,
        UIImage(named: ImageName.hawaii)!,
        UIImage(named: ImageName.pepperoni)!,
        UIImage(named: ImageName.margarita)!,
        UIImage(named: ImageName.hawaii)!,
        UIImage(named: ImageName.defaultPizza)!,
        UIImage(named: ImageName.hawaii)!,
        UIImage(named: ImageName.pepperoni)!,
        UIImage(named: ImageName.margarita)!,
        UIImage(named: ImageName.hawaii)!
    ]
    
    private var products: [Product] = []
    
    private var categories: [String] = [
        "Новинки",
        "Пиццы",
        "Комбо",
        "Закуски",
        "Завтраки",
        "Напитки"
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(StoriesTableViewCell.self, forCellReuseIdentifier: StoriesTableViewCell.reuseId)
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseID)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        fetchProducts()
    }
    
    private func fetchProducts() {
        products = productService.fetchProducts()
        tableView.reloadData()
    }
    
}

// MARK: - Setup Views & Layout

extension CatalogViewController {
        private func setupViews() {
            [tableView].forEach { view.addSubview($0) }
        }
        
        private func setupConstraints() {
            tableView.snp.makeConstraints { make in
                make.edges.equalTo(view.safeAreaLayoutGuide)
            }
        }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension CatalogViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        CatalogSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let catalogSection = CatalogSection(rawValue: section)
        
        switch catalogSection {
        case .stories:
            return 1
        case .products:
            return products.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let catalogSection = CatalogSection(rawValue: indexPath.section)
        
        switch catalogSection {
        case .stories:
            return configureStoriesCell(indexPath: indexPath)
        case .products:
            return configureMenuCell(indexPath: indexPath)
        default:
            return .init()
        }
    }
}

//MARK: - Configure Cell For Section

extension CatalogViewController {
    func configureStoriesCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoriesTableViewCell.reuseId, for: indexPath) as! StoriesTableViewCell
        
        cell.update(stories)
        
        return cell
    }
    
    func configureMenuCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseID, for: indexPath) as! ProductCell
        
        cell.update(product: products[indexPath.row])
        
        return cell
    }
}

#Preview {
    CatalogViewController()
}
