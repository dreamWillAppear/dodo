import UIKit
import SnapKit

final class BannersCollectionView: UICollectionView {
    
    private var banners: [Banner] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 260, height: 120)
        super.init(frame: .zero, collectionViewLayout: layout)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        dataSource = self
        delegate = self
        register(BannersCollectionViewCell.self, forCellWithReuseIdentifier: BannersCollectionViewCell.reuseID)
        showsHorizontalScrollIndicator = false
    }
    
    func update(banners: [Banner]) {
        self.banners = banners
    }
    
}

extension BannersCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannersCollectionViewCell.reuseID, for: indexPath) as? BannersCollectionViewCell else {
            return UICollectionViewCell.init()
        }
        
        cell.update(banner: banners[indexPath.row])
        
        return cell
    }
}

#Preview {
    CatalogViewController()
}
