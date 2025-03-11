import UIKit
import SnapKit

private enum CartViewSection: Int, CaseIterable {
    case product
}

final class CartViewController: UIViewController {

    let products: [Product]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CartProductCell.self, forCellReuseIdentifier: CartProductCell.reuseID)
        return tableView
    }()
    
    init(products: [Product]) {
        self.products = products
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
}

// MARK: - Setup Views & Layout

extension CartViewController {
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CartViewSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = CartViewSection(rawValue: indexPath.row)
        
        switch sections {
        case .product:
            return configureProductCell(indexPath: indexPath)
        default:
            return .init()
        }
    }

    private func configureProductCell(indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartProductCell.reuseID, for: indexPath) as? CartProductCell else {
            return .init()
        }
        
        cell.update(products[indexPath.row])
        
        return cell
    }
}
