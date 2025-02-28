import UIKit
import SnapKit

final class SectionLabelTableViewCell: UITableViewCell {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ text: String) {
        label.text = text
    }
    
}

extension SectionLabelTableViewCell {
    private func setupViews() {
        [label].forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
    }
}

#Preview {
    CatalogViewController()
}
