import UIKit
import SnapKit

final class DeliveryPriceButton: UIControl {
    var onAction: (()->())?
    private var rightImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private var leftImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   

}

//MARK: - Handler

extension DeliveryPriceButton {
    
    func tapAction() {
        //sendActions(for: .touchUpInside)
        onAction?()
    }
}

//MARK: - Layout

extension DeliveryPriceButton {
    
    private func setupViews() {
        
    }
    
    private func setupConstraints() {
        
    }
    
}

//MARK: - Gestures

extension DeliveryPriceButton {
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.addGestureRecognizer(tapGesture)
    }

}
