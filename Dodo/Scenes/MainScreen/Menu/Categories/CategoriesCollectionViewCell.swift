import UIKit
import SnapKit

protocol CategoriesCollectionViewCellDelegate: AnyObject {
    func didChangeCategory(_ categoryName: String)
}

final class CategoriesCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CategoriesCollectionViewCellDelegate?
    
    private lazy var isActive = false {
        didSet {
            checkState()
        }
    }
    
    private lazy var categoryNameLabel: InsetLabel = {
        let label = InsetLabel()
        label.contentInset = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        label.clipsToBounds = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        label.backgroundColor = .lightGray.withAlphaComponent(0.1)
        label.textColor = .darkGray
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        checkState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    func update(category: Category) {
        categoryNameLabel.text = category.label
        isActive = category.isSelected
    }
    
    
    private func checkState() {
        if isActive {
            categoryNameLabel.textColor = .orange
            categoryNameLabel.backgroundColor = .orange.withAlphaComponent(0.1)
        } else {
            categoryNameLabel.textColor = .darkGray
            categoryNameLabel.backgroundColor = .lightGray.withAlphaComponent(0.1)
        }
    }
    
    @objc private func didTapCategoryButton() {
        isActive.toggle()
        delegate?.didChangeCategory(categoryNameLabel.text ?? "")
    }
    
}

extension CategoriesCollectionViewCell {
    private func setupViews() {
        [categoryNameLabel].forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        categoryNameLabel.snp.makeConstraints { make in
            make.height.equalTo(34)
            make.edges.equalTo(contentView)
        }
    }
}

#Preview {
    CatalogViewController()
}
