import UIKit
import SnapKit

private enum CatalogSection: Int, CaseIterable {
    case stories
    case bannersLabel
    case banners
    case products
}

final class CatalogViewController: UIViewController {
    
    private let productService = ProductService.shared
    private let storiesService = StoriesService.shared
    private let bannersService = BannersService.shared
    
    private var stories: [Story] = []
    private var categories: [Category] = []
    private var products: [Product] = []
    private var banners: [Banner] = []

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(SectionLabelTableViewCell.self, forCellReuseIdentifier: SectionLabelTableViewCell.reuseID)
        tableView.register(BannersTableVeiwCell.self, forCellReuseIdentifier: BannersTableVeiwCell.reuseID)
        tableView.register(StoriesTableViewCell.self, forCellReuseIdentifier: StoriesTableViewCell.reuseID)
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.reuseID)
        tableView.register(CategoryHeaderView.self, forHeaderFooterViewReuseIdentifier: CategoryHeaderView.reuseID)
        tableView.sectionHeaderTopPadding = 0
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        fetchStories()
        fetchBanners()
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
    
    // MARK: - numberOfSections
    
    func numberOfSections(in tableView: UITableView) -> Int {
        CatalogSection.allCases.count
    }
    
    // MARK: - numberOfRowsInSection
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let catalogSection = CatalogSection(rawValue: section)
        
        switch catalogSection {
        case .stories:
            return 1
        case .bannersLabel:
            return 1
        case .banners:
            return 1
        case .products:
            return products.count
        default:
            return 0
        }
    }
    
    // MARK: - cellForRowAt
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let catalogSection = CatalogSection(rawValue: indexPath.section)
        
        switch catalogSection {
        case .stories:
            return configureStoriesCell(indexPath: indexPath)
        case .bannersLabel:
            return configureBannersLabelCell(indexPath: indexPath)
        case .banners:
            return configureBannersCell(indexPath: indexPath)
        case .products:
            return configureMenuCell(indexPath: indexPath)
        default:
            return .init()
        }
    }
    
    // MARK: - viewForHeaderInSection
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryHeaderView.reuseID) as? CategoryHeaderView else {
            return nil
        }
        
        let catalogSection = CatalogSection(rawValue: section)
        
        header.updateCategories(categories)
        
        switch catalogSection {
        case .products:
            return header
        default:
            return nil
        }
    }
    
    // MARK: - heightForHeaderInSection
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let catalogSection = CatalogSection(rawValue: section)
        
        switch catalogSection {
        case .products:
            return 80
        default:
            return 0.1
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let catalogSection = CatalogSection(rawValue: indexPath.section),
              catalogSection == .products else {
            return
        }
        
        let orderDetailsViewController = OrderDetailsViewController(product: products[indexPath.row])
        present(orderDetailsViewController, animated: true)
    }
    
}

//MARK: - Configure Cell For Section

extension CatalogViewController {
    func configureStoriesCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoriesTableViewCell.reuseID, for: indexPath) as! StoriesTableViewCell
        
        cell.update(stories)
        
        return cell
    }
    
    func configureBannersLabelCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SectionLabelTableViewCell.reuseID, for: indexPath) as! SectionLabelTableViewCell
        
        cell.update("Часто заказывают")
        
        return cell
    }
    
    func configureBannersCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BannersTableVeiwCell.reuseID, for: indexPath) as! BannersTableVeiwCell
        
        cell.update(banners)
        
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
    
    private func fetchStories() {
        stories = storiesService.fetchStories()
        tableView.reloadSections(IndexSet(integer: CatalogSection.stories.rawValue), with: .automatic)
    }
    
    private func fetchBanners() {
        banners = bannersService.fetchBanners()
        tableView.reloadSections(IndexSet(integer: CatalogSection.banners.rawValue), with: .automatic)
    }
    
    private func fetchProducts() {
        products = productService.fetchProducts()
        tableView.reloadSections(IndexSet(integer: CatalogSection.products.rawValue), with: .automatic)
    }
    
    private func fetchCategories() {
        categories = productService.fetchCategories()
        tableView.reloadSections(IndexSet(integer: CatalogSection.products.rawValue), with: .automatic)
    }
    
}

#Preview {
    CatalogViewController()
}
