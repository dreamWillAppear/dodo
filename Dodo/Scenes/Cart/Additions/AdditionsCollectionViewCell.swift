import UIKit
import SnapKit

final class AdditionsCollectionViewCell: UICollectionViewCell {
    
    private lazy var containterView: UIView = {
        let view = UIView()
        view.applyShadow(cornerRadius: 10)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var productImageView: UIImageView = {
        let width = UIScreen.main.bounds.width * 0.25
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: width).isActive = true
        return imageView
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textAlignment = .center
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
    
    func update(_ product: Product) {
        productImageView.image = UIImage(named: product.image)
        productNameLabel.text = product.name
    }
    
}

//MARK: - Setup Views & Layout

extension AdditionsCollectionViewCell {
    
    private func setupViews() {
        
        containterView.addSubview(productImageView)
        containterView.addSubview(productNameLabel)
        contentView.addSubview(containterView)
        
    }
    
    private func setupConstraints() {
        
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(5)
        }
        
        containterView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(4)
        }
    }
    
}

#Preview {
    CartViewController(products:
                        [Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false),
                         Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false)
                         ]
    )
}

