import UIKit
import SnapKit

final class CategoryHeaderView: UITableViewHeaderFooterView {
    
    static let reuseID = "CategoryHeader"
    
    private let categoriesCollectionView = CategoriesCollectionView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCategories(_ categories: [String]) {
        categoriesCollectionView.update(categories: categories)
    }
    
}

extension CategoryHeaderView {
    
    private func setupViews() {
        contentView.addSubview(categoriesCollectionView)
    }
    
    private func setupConstraints() {
        categoriesCollectionView.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.center.equalToSuperview()
            make.width.equalToSuperview().inset(16)
        }
    }
    
}
