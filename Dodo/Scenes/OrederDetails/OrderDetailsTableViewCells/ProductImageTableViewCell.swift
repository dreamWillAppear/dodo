import UIKit
import SnapKit

final class ProductImageTableViewCell: UITableViewCell {
    
    private lazy var productImageView: UIImageView = {
        let width = UIScreen.main.bounds.width
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: width * 0.85).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: width * 0.85).isActive = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ image: String) {
        productImageView.image = UIImage(named: image)
    }
    
}

extension ProductImageTableViewCell {
    private func setupViews() {
        contentView.addSubview(productImageView)
    }
    
    private func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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

