import UIKit
import SnapKit

final class CategoryHeader: UITableViewHeaderFooterView {
    static let reuseID = "CategoryHeader"
    
    
    

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CategoryHeader {
    
    private func setupViews() {
        
    }
    
    private func setupConstraints() {
        
    }
    
}
