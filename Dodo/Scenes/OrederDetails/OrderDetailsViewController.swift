import UIKit
import SnapKit

private enum OrderDetailsSection: Int, CaseIterable {
    case productImage
    case productNameAndDetails
    case ingredients
}

final class OrderDetailsViewController: UIViewController {
    
    private let product: Product
    
    private let ingredientsService = IngredientsService.shared
    
    private lazy var tabbleView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.sectionHeaderTopPadding = 0
        tableView.separatorStyle = .none
        tableView.register(ProductImageTableViewCell.self, forCellReuseIdentifier: ProductImageTableViewCell.reuseID)
        tableView.register(ProductNameAndDetailsCell.self, forCellReuseIdentifier: ProductNameAndDetailsCell.reuseID)
        tableView.register(IngredientsTableViewCell.self, forCellReuseIdentifier: IngredientsTableViewCell.reuseID)
        return tableView
    }()
    
    private var ingredients: [Ingredient] = []
    
    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        let width = UIScreen.main.bounds.width
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: width).isActive = true
        imageView.image = UIImage(named: product.image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init(product: Product) {
        self.product = product
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
        fetchIngredients()
    }
}

extension OrderDetailsViewController {
    private func setupViews() {
        view.addSubview(tabbleView)
    }
    
    private func setupConstraints() {
        tabbleView.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin)
            make.bottom.equalTo(view.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}


// MARK: - UITableViewDelegate & UITableViewDataSource

extension OrderDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - cellForRowAt
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let catalogSection = OrderDetailsSection(rawValue: indexPath.section)
        
        switch catalogSection {
        case .productImage:
            return productImageCellConfigure(indexPath: indexPath)
        case .productNameAndDetails:
            return productNameAndDetailsCellConfigure(indexPath: indexPath)
        case .ingredients:
            return ingredientsTableViewCellConfigure(indexPath: indexPath)
        default:
            return .init()
        }
    }
    
    
    // MARK: - numberOfSections
    
    func numberOfSections(in tableView: UITableView) -> Int {
        OrderDetailsSection.allCases.count
    }
    
    // MARK: - numberOfRowsInSection
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let catalogSection = OrderDetailsSection(rawValue: section)
        
        switch catalogSection {
        case .productImage:
            return 1
        case .productNameAndDetails:
            return 1
        case .ingredients:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let catalogSection = OrderDetailsSection(rawValue: indexPath.row)
        
        switch catalogSection {
        case .ingredients:
            return 1500
        default:
            return 0
        }
    }
}

//MARK: - Configure Cell For Section

extension OrderDetailsViewController {
    private func productImageCellConfigure(indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tabbleView.dequeueReusableCell(withIdentifier: ProductImageTableViewCell.reuseID, for: indexPath) as? ProductImageTableViewCell else {
            return .init()
        }
        
        cell.update(product.image)
        
        return cell
    }
    
    private func productNameAndDetailsCellConfigure(indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tabbleView.dequeueReusableCell(withIdentifier: ProductNameAndDetailsCell.reuseID, for: indexPath) as? ProductNameAndDetailsCell else {
            return .init()
        }
        
        cell.update(product.name, product.details)
        
        return cell
    }
    
    private func ingredientsTableViewCellConfigure(indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tabbleView.dequeueReusableCell(withIdentifier: IngredientsTableViewCell.reuseID, for: indexPath) as? IngredientsTableViewCell else {
            return .init()
        }
        
        cell.update(ingredients)
        
        return cell
    }
}

//MARK: - Networking

extension OrderDetailsViewController {
    
    private func fetchIngredients() {
        ingredientsService.fetchIngredientss { [weak self] result in
            switch result {
            case .success(let success):
                self?.ingredients = success
                
                DispatchQueue.main.async {
                    self?.tabbleView.reloadSections(IndexSet(integer: OrderDetailsSection.ingredients.rawValue), with: .automatic)
                }
                
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

#Preview {
    OrderDetailsViewController(
        product: Product(
            name: "Маргарита",
            details: "Тесто, Cыр, Колбаска",
            price: 650,
            image: ProductImageName.margarita,
            isAddition: false
        )
    )
}
