import UIKit
import SnapKit

final class IngredientsTableViewCell: UITableViewCell {
    
    private var collectionView = IngredientsCollectionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ ingredients: [Ingredient]) {
        collectionView.update(ingredients)
        
        collectionView.snp.updateConstraints { make in
            make.height.equalTo(CGFloat(ingredients.count / 3) * 190 + 20) //просто подогнал, не пойму как высоту ячейки забрать уже после отрисовки
        }
    }
    
}

extension IngredientsTableViewCell {
    private func setupViews() {
        [collectionView].forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(1500)
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
