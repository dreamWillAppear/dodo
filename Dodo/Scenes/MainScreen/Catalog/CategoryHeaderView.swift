import UIKit
import SnapKit

final class CategoryHeaderView: UITableViewHeaderFooterView {
    
    static let reuseID = "CategoryHeader"
    
    private let categoriesCollectionView = CategoriesCollectionView()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        categoriesCollectionView.categoriesDelegate = self
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCategories(_ categories: [Category]) {
        categoriesCollectionView.update(categories: categories)
    }
    
    func updateLabel(_ text: String) {
        label.text = text
    }
    
}

//MARK: - setupViews & setupConstraints

extension CategoryHeaderView {
    
    private func setupViews() {
        contentView.addSubview(categoriesCollectionView)
        contentView.addSubview(label)
    }
    
    private func setupConstraints() {
        categoriesCollectionView.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(categoriesCollectionView.snp.bottom).inset(5)
            make.height.equalTo(44)
            make.width.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
}

extension CategoryHeaderView: CategoriesCollectionViewDelegate {
    func didChangeCategory(_ categoryName: String) {
        label.text = categoryName
    }
}

#Preview {
    CatalogViewController()
}

