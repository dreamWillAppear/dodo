import UIKit
import SnapKit

final class CategoriesCollectionView: UICollectionView {
    
    static let reuseId = "CategoriesCollectionView"
    
    private var categories: [String] = []

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 30)
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        commonInit()
    }
    
    private func commonInit() {
        dataSource = self
        delegate = self
        showsHorizontalScrollIndicator = false
        register(<#T##nib: UINib?##UINib?#>, forCellWithReuseIdentifier: <#T##String#>)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func update(categories: [String]) {
        self.categories = categories
    }
    
}

extension CategoriesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}



