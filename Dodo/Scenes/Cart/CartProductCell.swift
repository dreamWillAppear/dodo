import UIKit
import SnapKit

final class CartProductCell: UITableViewCell {
    
    private var count = 0
    
    private lazy var deleteProductButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private lazy var productImageView: UIImageView = {
        let width = UIScreen.main.bounds.width
        let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: width * 0.15).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: width * 0.15).isActive = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        return verticalStackView
    }()
    
    private lazy var productNameLabel: UILabel = {
        let nameLabel = UILabel()
        
        return nameLabel
    }()
    
    private lazy var detailLabel: UILabel = {
        let nameLabel = UILabel()
        
        return nameLabel
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var changeProductButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private var cartStepper = CustomStepper()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        configureStepper()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ product: Product) {
        productImageView.image = UIImage(named: product.image)
        productNameLabel.text = product.name
        productNameLabel.text = product.details
        productPriceLabel.text = "\(product.price) Р"
    }
    
}

extension CartProductCell {
    private func setupViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(deleteProductButton)
        verticalStackView.addArrangedSubview(productNameLabel)
        verticalStackView.addArrangedSubview(detailLabel)
        contentView.addSubview(separatorView)
        contentView.addSubview(productPriceLabel)
        contentView.addSubview(cartStepper)
    }
    
    private func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading)
            
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.leading.equalTo(productImageView.snp.leading)
            make.top.equalTo(contentView.snp.top)
        }
    }
}

extension CartProductCell {
    private func configureStepper() {
        cartStepper.addTarget(self, action: #selector(stepperChangedValueAction), for: .valueChanged)
    }
    
    @objc private func stepperChangedValueAction(sender: CustomStepper) {
        count = sender.currentValue
    }
}

//#Preview {
//    CartViewController(products:
//                        [Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii"),
//                         Product(name: "Маргарита", details: "Тесто, Cыр, Колбаска", price: 650, image: "margarita"),
//                         Product(name: "Пепперони", details: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni")]
//    )
//}
