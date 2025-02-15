import UIKit
import SnapKit

final class CategoriesCollectionViewCell: UICollectionViewCell {
    
    private lazy var isActive = false {
        didSet {
            checkState()
        }
    }
    
    private lazy var categoryButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8)
        
        let button = UIButton(configuration: configuration)
        button.layer.cornerRadius = 18
        button.clipsToBounds = false
        button.backgroundColor = .lightGray.withAlphaComponent(0.1)
        button.setTitleColor(.darkGray, for: .normal)
        button.setTitle("title", for: .normal)
        button.addTarget(self, action: #selector(didTapCategoryButton), for: .touchUpInside)
        return button
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
    
    func update(categoryName: String) {
        categoryButton.setTitle(categoryName, for: .normal)
    }
    
    func update(category: Category) {
        categoryButton.setTitle(category.label, for: .normal)
        isActive = category.isActive
    }
    
    
    private func checkState() {
        if isActive {
            categoryButton.setTitleColor(.orange, for: .normal)
            categoryButton.backgroundColor = .orange.withAlphaComponent(0.1)
        } else {
            categoryButton.setTitleColor(.darkGray, for: .normal)
            categoryButton.backgroundColor = .lightGray.withAlphaComponent(0.1)
        }
    }
    
    @objc private func didTapCategoryButton() {
        isActive.toggle()
    }
    
}

extension CategoriesCollectionViewCell {
    private func setupViews() {
        [categoryButton].forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        categoryButton.snp.makeConstraints { make in
            make.height.width.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
}

#Preview {
    CatalogViewController()
}
