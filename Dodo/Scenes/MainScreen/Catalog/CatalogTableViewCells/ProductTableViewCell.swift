import UIKit
import SnapKit

final class ProductTableViewCell: UITableViewCell {
    
    // MARK: - Private Properties
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.applyShadow(cornerRadius: 10)
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.alignment = .leading
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 10,
            leading: 15,
            bottom: 12,
            trailing: 0
        )
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "Тесто и всякое"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    var priceButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(
            top: 5,
            leading: 10,
            bottom: 5,
            trailing: 10
        )
        
        let button = UIButton(configuration: configuration)
        button.setTitle("от 100 р", for: .normal)
        button.setTitleColor(.brown, for: .normal)
        button.backgroundColor = .orange.withAlphaComponent(0.1)
        button.layer.cornerRadius = 20
        
        return button
    }()
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        let width = UIScreen.main.bounds.width
        imageView.image = UIImage(named: PizzaImageName.defaultPizza)
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: width * 0.4).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: width * 0.4).isActive = true
        return imageView
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ProductTableViewCell.reuseID)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup Views & Setup Layout

extension ProductTableViewCell {
    
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(containerView)
        [productImageView, verticalStackView].forEach { containerView.addSubview($0) }
        [nameLabel, detailLabel, priceButton].forEach { verticalStackView.addArrangedSubview($0) }
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentView).inset(16)
            make.top.bottom.equalTo(contentView).inset(8)
        }
        
        productImageView.snp.makeConstraints { make in
            make.leading.equalTo(containerView).inset(16)
            make.centerY.equalTo(containerView)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalTo(containerView).inset(16)
            make.leading.equalTo(productImageView.snp.trailing).offset(16)
        }
    }
    
}

// MARK: - Configure Cell

extension ProductTableViewCell {
    
    func update(product: Product) {
        productImageView.image = UIImage(named: product.image)
        nameLabel.text = product.name
        detailLabel.text = product.details
        priceButton.setTitle("от \(product.price.formatted()) р", for: .normal)
    }
    
}

#Preview {
    CatalogViewController()
}
