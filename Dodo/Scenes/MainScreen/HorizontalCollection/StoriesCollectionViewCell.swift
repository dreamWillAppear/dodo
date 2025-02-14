import UIKit
import SnapKit

final class StoriesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "PhotoCollectionCell"
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: ImageName.defaultPizza)
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
    
    func update(story: UIImage) {
        photoImageView.image = story
    }
    
}

extension StoriesCollectionViewCell {
    private func setupViews() {
        [photoImageView].forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
    }
}

