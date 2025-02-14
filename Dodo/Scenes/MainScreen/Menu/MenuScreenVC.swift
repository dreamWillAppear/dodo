import UIKit
import SnapKit

final class MenuScreenVC: UIViewController {
    
    // MARK: - Private Properties
    
    private var products: [Product] = []
    
    private let productService = ProductService.shared
    
    private lazy var tableView: UITableView  = { //в гайде без lazy ?
        let tableView = UITableView() //зачем проставлять .init() ?
        tableView.backgroundColor = .orange
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell(ProductCell.self)
        
        return tableView
    } ()
    
    // MARK: - Overrides Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        setupViews()
        setupConstraints()
        fetchProducts()
    }
    
}

// MARK: - Setup Views & Layout

extension MenuScreenVC {
    
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

extension MenuScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(indexPath) as ProductCell
        cell.update(product: products[indexPath.row])
        
        return cell
    }
    
}

// MARK: - Product Service

extension MenuScreenVC {
    
    func fetchProducts() {
        products = productService.fetchProducts()
    }
    
}

#Preview {
    MenuScreenVC()
}
