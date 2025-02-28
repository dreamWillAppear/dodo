import UIKit
import SnapKit

protocol CategoriesCollectionViewDelegate: AnyObject {
    func didChangeCategory(_ categoryName: String)
}

final class CategoriesCollectionView: UICollectionView {
    
    weak var delgate: CategoriesCollectionViewDelegate?
    
    static let reuseId = "CategoriesCollectionView"
    
    private var categories: [String] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        super.init(frame: .zero, collectionViewLayout: layout)
        
        commonInit()
    }
    
    private func commonInit() {
        heightAnchor.constraint(equalToConstant: 60).isActive = true
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

//MARK: -  UICollectionViewDelegate, UICollectionViewDataSource

extension CategoriesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseID, for: indexPath) as! CategoriesCollectionViewCell
        
        cell.update(categoryName: categories[indexPath.row])
        cell.delegate = self
        
        return cell
    }
}

//MARK: - CategoriesCollectionViewCellDelegate

extension CategoriesCollectionView: CategoriesCollectionViewCellDelegate {
    func didChangeCategory(_ categoryName: String) {
        delgate?.didChangeCategory(categoryName)
    }
    
}

#Preview {
    CatalogViewController()
}
