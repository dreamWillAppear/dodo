import UIKit
import SnapKit

final class CartProductCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var deleteProductButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "multiply")?
            .withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        return button
    }()
    
    private lazy var productImageView: UIImageView = {
        let width = UIScreen.main.bounds.width * 0.17
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: width).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
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
        let detailLabel = UILabel()
        detailLabel.textColor = .lightGray
        detailLabel.font = .systemFont(ofSize: 15)
        detailLabel.numberOfLines = 0
        return detailLabel
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var count = 1
    private var cartStepper = CustomStepper()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        containerView.backgroundColor = .white
       //contentView.backgroundColor = .systemGray6
        setupViews()
        setupConstraints()
        configureStepper()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Update Cell
    
    func update(_ product: Product) {
        productImageView.image = UIImage(named: product.image)
        productNameLabel.text = product.name
        detailLabel.text = product.details
        productPriceLabel.text = "\(product.price) Р"
    }
    
}

    //MARK: - Setup Views & Constraints

extension CartProductCell {
    
    private func setupViews() {
        contentView.addSubview(containerView)
        verticalStackView.addArrangedSubview(productNameLabel)
        verticalStackView.addArrangedSubview(detailLabel)
        [
            verticalStackView,
            productImageView,
            deleteProductButton,
            separatorView,
            productPriceLabel,
            cartStepper
        ].forEach { containerView.addSubview($0) }
        
    }
    
    private func setupConstraints() {

        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(150)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview()
        }
    
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.equalToSuperview()
        }
        
        deleteProductButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.height.width.equalTo(40)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.equalTo(productImageView.snp.trailing).offset(16)
        }
        
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(productImageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
        
        productPriceLabel.snp.makeConstraints { make in
            make.centerY.equalTo(cartStepper.snp.centerY)
            make.leading.equalToSuperview()
        }
        
        cartStepper.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
        
    }
}

//MARK: - Configure Stepper

extension CartProductCell {
    private func configureStepper() {
        cartStepper.addTarget(self, action: #selector(stepperChangedValueAction), for: .valueChanged)
    }
    
    @objc private func stepperChangedValueAction(sender: CustomStepper) {
        count = sender.currentValue
    }
}

#Preview {
    CartViewController(products:
                        [Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false),
                         Product(name: "Маргарита", details: "Тесто, Cыр, Колбаска", price: 650, image: "margarita", isAddition: false),
                         Product(name: "Пепперони", details: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni", isAddition: false)]
    )
}
