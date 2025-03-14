import UIKit
import SnapKit

final class SummaryLabelCell: UITableViewCell {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.contentMode = .left
        label.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Update Cell
    
    func update(_ text: String) {
        label.text = text
    }
    
}

    //MARK: - Setup Views & Constraints

extension SummaryLabelCell {
    
    private func setupViews() {
        contentView.addSubview(label)
    }
    
    private func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

#Preview {
    CartViewController(products:
                        [Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false),
                         Product(name: "Маргарита", details: "Тесто, Cыр, Колбаска", price: 650, image: "margarita", isAddition: false),
                         Product(name: "Пепперони", details: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni", isAddition: false)]
    )
}

