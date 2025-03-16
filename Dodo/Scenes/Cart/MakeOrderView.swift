import UIKit
import SnapKit

final class MakeOrderView: UIView {
    
    var deliveryPriceButton = DeliveryPriceButton()
    
    private var orderPrice: Int = 0
    
    private lazy var makeOrederButton: UIButton = {
        let button = UIButton()
        button.setTitle("Оформить заказ на \(orderPrice) ₽", for: .normal)
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 25
        button.backgroundColor = .orange
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Setup Views & Layout

extension MakeOrderView {
    
    private func setupViews() {
        self.addSubview(makeOrederButton)
        self.addSubview(deliveryPriceButton)
    }
    
    private func setupConstraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(130)
        }
        
        deliveryPriceButton.backgroundColor = .red
        deliveryPriceButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview()
        }
        
        makeOrederButton.snp.makeConstraints { make in
            make.top.equalTo(deliveryPriceButton.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
    
}

extension MakeOrderView {
    
    func update(_ price: String) {
        
    }
    
}

#Preview {
    CartViewController(products:
                        [Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false),
                         Product(name: "Маргарита", details: "Тесто, Cыр, Колбаска", price: 650, image: "margarita", isAddition: false),
                         Product(name: "Пепперони", details: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni", isAddition: false),
                         Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false),
                         Product(name: "Маргарита", details: "Тесто, Cыр, Колбаска", price: 650, image: "margarita", isAddition: false),
                         Product(name: "Пепперони", details: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni", isAddition: false),
                         Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false),
                         Product(name: "Маргарита", details: "Тесто, Cыр, Колбаска", price: 650, image: "margarita", isAddition: false),
                         Product(name: "Пепперони", details: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni", isAddition: false)]
    )
}

