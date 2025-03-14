import UIKit
import SnapKit

final class BannersCollectionViewCell: UICollectionViewCell {
    
    private lazy var productImageView: UIImageView = {
        let width = UIScreen.main.bounds.width
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .orange
        imageView.image = UIImage(named: ProductImageName.defaultPizza)
        imageView.widthAnchor.constraint(equalToConstant: width * 0.2).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: width * 0.2).isActive = true
        return imageView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.applyShadow(cornerRadius: 10)
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 10,
            leading: 5,
            bottom: 12,
            trailing: 5
        )
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Пицца"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Тесто и всякое"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .darkGray
        label.numberOfLines = 0
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
    
    func update(banner: Banner) {
        productImageView.image = UIImage(named: banner.image)
        nameLabel.text = banner.name
        priceLabel.text = "от \(banner.price) р"
    }
    
}

extension BannersCollectionViewCell {
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(containerView)
        [productImageView, verticalStackView].forEach { containerView.addSubview($0) }
        [nameLabel, priceLabel].forEach { verticalStackView.addArrangedSubview($0) }
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentView).inset(8)
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

#Preview {
    CatalogViewController()
}
