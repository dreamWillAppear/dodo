import UIKit
import SnapKit

private enum CatalogSection: Int, CaseIterable {
    case stories
    case products
}

final class CatalogViewController: UIViewController {
    
    private let productService = ProductService.shared
    private let storiesService = StoriesService.shared
    
    private var stories: [Story] = []
    private var categories: [String] = []
    private var products: [Product] = []

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(SectionLabelTableViewCell.self, forCellReuseIdentifier: SectionLabelTableViewCell.reuseID)
        tableView.register(StoriesTableViewCell.self, forCellReuseIdentifier: StoriesTableViewCell.reuseID)
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.reuseID)
        tableView.register(CategoryHeaderView.self, forHeaderFooterViewReuseIdentifier: CategoryHeaderView.reuseID)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        fetchStories()
        fetchCategories()
        fetchProducts()
    }
        
}

// MARK: - Setup Views & Layout

extension CatalogViewController {
    private func setupViews() {
        [tableView].forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryHeaderView.reuseID) as? CategoryHeaderView else {
            return nil
        }
        
        let catalogSection = CatalogSection(rawValue: section)
        
        header.updateCategories(categories)
        
        switch catalogSection {
        case .stories:
            return nil
        case .products:
            return header
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let catalogSection = CatalogSection(rawValue: section)
        
        switch catalogSection {
        case .products:
            return 80
        default:
            return CGFloat.leastNormalMagnitude
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let catalogSection = CatalogSection(rawValue: section)
        
        switch catalogSection {
        case .stories:
            return CGFloat.leastNormalMagnitude
        default:
            return 0
        }
    }

}

//MARK: - Configure Cell For Section

extension CatalogViewController {

    func configureStoriesCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoriesTableViewCell.reuseID, for: indexPath) as! StoriesTableViewCell
        
        cell.update(stories)
        
        return cell
    }
        
    func configureMenuCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseID, for: indexPath) as! ProductTableViewCell
        
        cell.update(product: products[indexPath.row])
        
        return cell
    }
    
}

//MARK: - Networking

extension CatalogViewController {
    private func fetchProducts() {
        products = productService.fetchProducts()
        tableView.reloadData()
    }
    
    private func fetchCategories() {
        categories = productService.fetchCategories()
        tableView.reloadData()
    }
    
    private func fetchStories() {
        stories = storiesService.fetchStories()
        tableView.reloadData()
    }
}

#Preview {
    CatalogViewController()
}
