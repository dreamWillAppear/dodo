import UIKit
import SnapKit

final class OrderDetailsViewController: UIViewController {
    
    private let ingredientsService = IngredientsService.shared
    
    private var ingredients: [Ingredient] = [] {
        didSet {
            ingredientsCollectionView.update(ingredients)
            calculateCollectionViewHeight()
        }
    }
    
    private var collectionViewHeight: CGFloat = 0 {
        didSet {
            ingredientsCollectionView.snp.updateConstraints { make in
                make.height.equalTo(collectionViewHeight)
            }
            view.layoutIfNeeded()
        }
    }
    
    private let product: Product
    
    private let ingredientsCollectionView = IngredientsCollectionView()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
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
        
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = product.name
        label.textColor = .black
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.text = product.details
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
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
        calculateCollectionViewHeight()
    }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           calculateCollectionViewHeight()
       }
}

extension OrderDetailsViewController {
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(verticalStackView)
        [productImageView, nameLabel, detailLabel, ingredientsCollectionView].forEach { verticalStackView.addArrangedSubview($0) }
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
         }
            
        ingredientsCollectionView.snp.makeConstraints { make in
            make.height.equalTo(0)
        }
    }
}

//MARK: - Calculate Collection View Height

extension OrderDetailsViewController {
    private func calculateCollectionViewHeight() {
        let rows = ceil(Double(ingredients.count) / 3.0)
        let itemHeight: CGFloat = 160
        let spacing: CGFloat = 10
        
        let newHeight = (CGFloat(rows) * itemHeight) + (CGFloat(rows - 1) * spacing)
        
        if collectionViewHeight != newHeight {
            collectionViewHeight = newHeight
        }
    }
}

//MARK: - Networking

extension OrderDetailsViewController {
    private func fetchIngredients() {
        ingredients = ingredientsService.fetchIngredientss()
        ingredientsCollectionView.update(ingredients)
    }
}

#Preview {
    OrderDetailsViewController(
        product: Product(
            name: "Маргарита",
            details: "Тесто, Cыр, Колбаска",
            price: 650,
            image: PizzaImageName.margarita
        )
    )
}

