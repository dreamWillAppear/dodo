import UIKit
import SnapKit

final class StoriesCollectionView: UICollectionView {
    
    private var stories: [UIImage] = []
    
//    static var layout: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 100, height: 150)
//        
//        return layout
//    }()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 150)
            
        super.init(frame: .zero, collectionViewLayout: layout)
        
        commonInit()
    }
    
//    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
//        super.init(frame: frame, collectionViewLayout: layout)
//        
//        commonInit()
//    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.dataSource = self
        self.delegate = self
        self.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: StoriesCollectionViewCell.reuseId)
        self.showsHorizontalScrollIndicator = false
    }
    
    func update(stories: [UIImage]) {
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

