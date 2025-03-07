import UIKit
import SnapKit

final class ProductNameAndDetailsCell: UITableViewCell {
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productNameLabel, detailsLabel])
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .leading
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 10, leading: 0, bottom: 10, trailing: 0
        )
        return stack
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ name: String, _ details: String) {
        productNameLabel.text = name
        detailsLabel.text = details
    }
}

extension ProductNameAndDetailsCell {
    private func setupViews() {
        contentView.addSubview(verticalStackView)
    }
    
    private func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
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
