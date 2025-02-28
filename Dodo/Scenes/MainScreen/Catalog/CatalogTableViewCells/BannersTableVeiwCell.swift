import UIKit
import SnapKit

final class BannersTableVeiwCell: UITableViewCell {
    
    private let collectionView = BannersCollectionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ banners: [Banner]) {
        collectionView.update(banners: banners)
    }
    
}

extension BannersTableVeiwCell {
    private func setupViews() {
        [collectionView].forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(110)
        }
    }
}

#Preview {
    CatalogViewController()
}
