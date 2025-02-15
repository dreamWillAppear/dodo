import UIKit
import SnapKit

final class StoriesCollectionView: UICollectionView {
    
    private var stories: [Story] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 85, height: 110)
        super.init(frame: .zero, collectionViewLayout: layout)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        dataSource = self
        delegate = self
        register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: StoriesCollectionViewCell.reuseId)
        showsHorizontalScrollIndicator = false
    }
    
    func update(stories: [Story]) {
        self.stories = stories
    }
    
}

extension StoriesCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesCollectionViewCell.reuseId, for: indexPath) as? StoriesCollectionViewCell else {
            return UICollectionViewCell.init()
        }
        
        cell.update(story: stories[indexPath.row])
        
        return cell
    }
}

#Preview {
    CatalogViewController()
}
