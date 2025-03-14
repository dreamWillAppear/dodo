import UIKit
import SnapKit

final class IngredientsCollectionView: UICollectionView {
    
    lazy var ingredientsCount = ingredients.count
    
    private var ingredients: [Ingredient] = []
        
    let width = UIScreen.main.bounds.width
        
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width / 3 - 18, height: 150)
        layout.minimumLineSpacing = 10
        super.init(frame: .zero, collectionViewLayout: layout)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ ingredients: [Ingredient]) {
        self.ingredients = ingredients
        reloadData()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        dataSource = self
        delegate = self
        showsVerticalScrollIndicator = false
        registerCell(IngredientsCollectionViewCell.self)
    }
    
}

//MARK: - UICollectionViewDelegate & UICollectionViewDataSource

extension IngredientsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ingredients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngredientsCollectionViewCell.reuseID, for: indexPath) as? IngredientsCollectionViewCell else {
            return .init()
        }
        
        cell.update(ingredients[indexPath.row])
    
        return cell
    }
}

#Preview {
    OrderDetailsViewController(
        product: Product(
            name: "Маргарита",
            details: "Тесто, Cыр, Колбаска",
            price: 650,
            image: ProductImageName.margarita,
            isAddition: false
        )
    )
}
