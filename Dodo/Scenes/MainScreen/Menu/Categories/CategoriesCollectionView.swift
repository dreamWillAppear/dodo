import UIKit
import SnapKit

final class CategoriesCollectionView: UICollectionView {
    
    static let reuseId = "CategoriesCollectionView"
    
    private var categories: [String] = ["     ", "     ", "     "]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 34)
        layout.minimumLineSpacing = 10
        super.init(frame: .zero, collectionViewLayout: layout)
        
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        dataSource = self
        delegate = self
        showsHorizontalScrollIndicator = false
        registerCell(CategoriesCollectionViewCell.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(categories: [String]) {
        self.categories = categories
        reloadData()
    }
    
}

extension CategoriesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseID, for: indexPath) as! CategoriesCollectionViewCell
        
        cell.update(categoryName: categories[indexPath.row])
        
        return cell
    }
}

#Preview {
    CatalogViewController()
}
