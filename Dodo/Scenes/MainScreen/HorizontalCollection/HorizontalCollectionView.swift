import SnapKit
import UIKit

final class HorizontalCollectionView: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .blue
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: StoriesCollectionViewCell.reuseId)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
}

// MARK: - Setup Views & Layout

extension HorizontalCollectionView {
    private func setupViews() {
        [collectionView].forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width)
            make.centerY.equalTo(view.snp.centerY)
            make.height.equalTo(140)
        }
    }
}

// MARK: - UICollectionViewDelegate

extension HorizontalCollectionView: UICollectionViewDelegate {
    
}

extension HorizontalCollectionView: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesCollectionViewCell.reuseId, for: indexPath) as! StoriesCollectionViewCell
        
        cell.backgroundColor = .white
        return cell
    }
}

#Preview {
    HorizontalCollectionView()
}
