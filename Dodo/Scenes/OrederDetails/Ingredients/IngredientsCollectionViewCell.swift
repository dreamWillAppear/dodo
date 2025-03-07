import UIKit
import SnapKit

final class IngredientsCollectionViewCell: UICollectionViewCell {
    
    private var isSelectedIngredient = false
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.applyShadow(cornerRadius: 10)
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.clear.cgColor
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 5,
            leading: 5,
            bottom: 5,
            trailing: 5
        )
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.clipsToBounds = true
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        let width = UIScreen.main.bounds.width
        imageView.heightAnchor.constraint(equalToConstant: width * 0.23).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: width * 0.23).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: PizzaImageName.defaultPizza)
        return imageView
    }()
    
    private lazy var ingredientNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ ingredient: Ingredient) {
        photoImageView.image = UIImage(named: ingredient.image)
        ingredientNameLabel.text = ingredient.name
        priceLabel.text = "\(ingredient.price) Р"
        isSelectedIngredient = ingredient.isSelected
        updateSelectedState()
    }
    
    private func updateSelectedState() {
        containerView.layer.borderColor = isSelectedIngredient ? UIColor.orange.cgColor : UIColor.clear.cgColor
    }
    
}

extension IngredientsCollectionViewCell {
    private func setupViews() {
        verticalStackView.addArrangedSubview(ingredientNameLabel)
        verticalStackView.addArrangedSubview(priceLabel)

        containerView.addSubview(photoImageView)
        containerView.addSubview(verticalStackView)
        contentView.addSubview(containerView)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.centerX.equalToSuperview()
        }

        verticalStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
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
