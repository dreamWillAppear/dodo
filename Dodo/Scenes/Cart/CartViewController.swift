import UIKit
import SnapKit

private enum CartSections: Int, CaseIterable {
    case priceLabel
    case product
    case additions
    case summary
}

final class CartViewController: UIViewController {
    
    private let productSercvice = ProductService.shared
    
    private var products: [Product]
    
    private var additionalProducts: [Product] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.register(PriceLabelCell.self, forCellReuseIdentifier: PriceLabelCell.reuseID)
        tableView.register(CartProductCell.self, forCellReuseIdentifier: CartProductCell.reuseID)
        tableView.register(AdditionsCell.self, forCellReuseIdentifier: AdditionsCell.reuseID)
        tableView.register(SummaryCell.self, forCellReuseIdentifier: SummaryCell.reuseID)
        return tableView
    }()
    
    private lazy var makeOrderView = MakeOrderView()
    
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
        fetchAdditionProducts()
        observe()
    }
}

extension CartViewController {
    func observe() {
      
        makeOrderView.deliveryPriceButton.onAction = {
            //TODO: Bottom Sheet Needed
        }
        
    }
        
    func makeOrderButtonTapped() {
        
    }
    
}

// MARK: - Setup Views & Layout

extension CartViewController {
    private func setupViews() {
        view.addSubview(tableView)
        view.addSubview(makeOrderView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        makeOrderView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        CartSections.allCases.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sections = CartSections(rawValue: section)
        
        switch sections {
        case .priceLabel:
            return 1
        case .product:
            return products.count
        case .additions:
            return 1
        case .summary:
            return 1
        default :
            return 0
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = CartSections(rawValue: indexPath.section)
        
        switch sections {
        case .priceLabel:
            return configurePriceLabelCell(indexPath: indexPath)
        case .product:
            return configureProductCell(indexPath: indexPath)
        case .additions:
            return configureAdditionalCell(indexPath: indexPath)
        case .summary:
            return configureSummaryCell(indexPath: indexPath)
        default:
            return .init()
        }
    }
    
}

//MARK: - Configure Cells

extension CartViewController {
    
    private func configureProductCell(indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartProductCell.reuseID, for: indexPath) as? CartProductCell else {
            return .init()
        }
        
        cell.update(products[indexPath.row])
        
        return cell
    }
    
    private func configurePriceLabelCell(indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PriceLabelCell.reuseID, for: indexPath) as? PriceLabelCell else {
            return .init()
        }
        
        let totalPrice = products.map { $0.price }.reduce(0, +)
        let productCount = products.count
        
        cell.update("\(productCount) товара на сумму \(totalPrice) ₽")
        
        return cell
        
    }
    
    private func configureAdditionalCell(indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AdditionsCell.reuseID, for: indexPath) as? AdditionsCell else {
            return .init()
        }
        
        cell.update(additionalProducts)
        
        return cell
        
    }
    
    private func configureSummaryCell(indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SummaryCell.reuseID, for: indexPath) as? SummaryCell else {
            return .init()
        }
        
        return cell
        
    }
    
}

//MARK: - Networking

extension CartViewController {
    
    private func fetchAdditionProducts() {
        additionalProducts = productSercvice.fetchProducts().filter { $0.isAddition }
    }
    
}

#Preview {
    CartViewController(products:
                        [Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false),
                         Product(name: "Маргарита", details: "Тесто, Cыр, Колбаска", price: 650, image: "margarita", isAddition: false),
                         Product(name: "Пепперони", details: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni", isAddition: false),
                         Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false),
                         Product(name: "Маргарита", details: "Тесто, Cыр, Колбаска", price: 650, image: "margarita", isAddition: false),
                         Product(name: "Пепперони", details: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni", isAddition: false),
                         Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false),
                         Product(name: "Маргарита", details: "Тесто, Cыр, Колбаска", price: 650, image: "margarita", isAddition: false),
                         Product(name: "Пепперони", details: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni", isAddition: false)]
    )
}

