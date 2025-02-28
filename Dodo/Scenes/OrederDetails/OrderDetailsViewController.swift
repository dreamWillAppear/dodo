import UIKit
import SnapKit

final class OrderDetailsViewController: UIViewController {
    
    private let product: Product
    
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
    }

}


extension OrderDetailsViewController {
    private func setupViews() {
        [productImageView, nameLabel, detailLabel].forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom)
            make.leading.equalToSuperview().inset(16)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(16)
        }
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

