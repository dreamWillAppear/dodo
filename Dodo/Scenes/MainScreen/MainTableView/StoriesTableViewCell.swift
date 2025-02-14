import UIKit
import SnapKit

final class StoriesTableViewCell: UITableViewCell {
    
    static let reuseId = "StoriesTableViewCell"
    
    private let collectionView = StoriesCollectionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ stories: [UIImage]) {
        collectionView.update(stories: stories)
    }
    
}

extension StoriesTableViewCell {
    private func setupViews() {
        [collectionView].forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
            make.height.equalTo(140)
        }
    }
}

#Preview {
    CatalogViewController()
}
