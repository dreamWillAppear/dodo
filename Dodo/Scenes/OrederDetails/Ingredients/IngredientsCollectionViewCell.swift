import UIKit
import SnapKit

import UIKit
import SnapKit

final class IngredientsCollectionViewCell: UICollectionViewCell {
        
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.backgroundColor = .orange
        imageView.image = UIImage(named: PizzaImageName.defaultPizza)
        return imageView
    }()
    
    private lazy var ingredientNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
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
    }
    
}

extension IngredientsCollectionViewCell {
    private func setupViews() {
        [photoImageView, ingredientNameLabel, priceLabel].forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.height.width.equalToSuperview()
        }
    }
}

#Preview {
    CatalogViewController()
}
