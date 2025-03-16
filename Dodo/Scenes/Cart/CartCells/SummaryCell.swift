import UIKit
import SnapKit

final class SummaryCell: UITableViewCell {
    
    private lazy var promocodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ввести промокод", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 25
        return button
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .trailing
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var leftStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var productsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "* товар"
        return label
    }()
    
    private lazy var coinNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Додокоины"
        return label
    }()
    
    private lazy var deliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Доставка"
        return label
    }()
    
    private lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "0 ₽"
        return label
    }()
    
    private lazy var coinCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0 ∂"
        return label
    }()
    
    private lazy var deliveryPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "0 ₽"
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
    
    func update() {
        
    }
    
}

//MARK: - Setup Views & Constraints

extension SummaryCell {
    
    private func setupViews() {
        [productsCountLabel, coinNameLabel, deliveryLabel].forEach { leftStackView.addArrangedSubview($0) }
        [totalPriceLabel, coinCountLabel, deliveryPriceLabel].forEach { rightStackView.addArrangedSubview($0) }
        [promocodeButton ,leftStackView, rightStackView].forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(200)
        }
        
        promocodeButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(35)
            make.height.equalTo(55)
        }
        
        leftStackView.snp.makeConstraints { make in
            make.top.equalTo(promocodeButton.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalTo(contentView.snp.centerX)
            make.height.equalTo(100)
        }
        
        rightStackView.snp.makeConstraints { make in
            make.top.equalTo(promocodeButton.snp.bottom)
            make.trailing.equalToSuperview()
            make.leading.equalTo(contentView.snp.centerX)
            make.height.equalTo(100)
        }
        
    }
}

#Preview {
    CartViewController(products:
                        [Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false),
                        ]
    )
}

