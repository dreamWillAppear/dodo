import UIKit
import SnapKit

final class AdditionsCollectionView: UICollectionView {
    
    private var additionsProducts: [Product] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 110, height: 140)
        super.init(frame: .zero, collectionViewLayout: layout)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        dataSource = self
        delegate = self
        showsHorizontalScrollIndicator = false
        register(AdditionsCollectionViewCell.self, forCellWithReuseIdentifier: AdditionsCollectionViewCell.reuseID)
    }
    
    func update(_ products: [Product]) {
        additionsProducts = products
    }
    
}

extension AdditionsCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        additionsProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdditionsCollectionViewCell.reuseID, for: indexPath) as?
                AdditionsCollectionViewCell else {
            return .init()
        }
        
        cell.update(additionsProducts[indexPath.row])
        
        return cell
    }
    
}

#Preview {
    CartViewController(products:
                        [Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false),
                         
                         Product(name: "Гавайская", details: "Тесто, Cыр, Буженина", price: 590, image: "hawaii", isAddition: false)
                        ]
    )
}
