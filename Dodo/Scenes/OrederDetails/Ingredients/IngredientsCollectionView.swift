import UIKit
import SnapKit

final class IngredientsCollectionView: UICollectionView {
    
    private let ingredients: [Ingredient] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .vertical
      
        super.init(frame: .zero, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .clear
        dataSource = self
        delegate = self
        showsHorizontalScrollIndicator = false
        registerCell(IngredientsCollectionViewCell.self)
    }
    
}

//MARK: - UICollectionViewDelegate & UICollectionViewDataSource

extension IngredientsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ingredients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        .init()
    }
}
