import UIKit

protocol Reusable {}

extension UITableViewCell: Reusable {}

extension UICollectionViewCell: Reusable {}

extension Reusable where Self: UITableViewCell {
    static var reuseID: String {
        return String.init(describing: self)
    }
}

extension Reusable where Self: UICollectionViewCell {
    static var reuseID: String {
        return String(describing: self)
    }
}
