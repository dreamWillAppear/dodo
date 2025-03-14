import UIKit
import SnapKit

final class StoriesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "PhotoCollectionCell"
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.backgroundColor = .orange
        imageView.image = UIImage(named: ProductImageName.defaultPizza)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(story: Story) {
        photoImageView.image = story.image
    }
    
}

extension StoriesCollectionViewCell {
    private func setupViews() {
        [photoImageView].forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.height.width.equalToSuperview()
        }
    }
}

#Preview {
    CatalogViewController()
}
