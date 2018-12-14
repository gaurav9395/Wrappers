import UIKit

protocol Registerable {
    static var identifier: String { get }
    static func cellFor<T: Registerable>(_ parent: UIDataSourceTranslating, _ indexPath: IndexPath) -> T
    static func dequeReusably(for parent: UIDataSourceTranslating, at indexPath: IndexPath) -> Self
}

extension Registerable {
    static var identifier: String { return "\(self)" }

    internal static func cellFor<T: Registerable>(_ parent: UIDataSourceTranslating, _ indexPath: IndexPath) -> T {
        if let table = parent as? UITableView {
            return table.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
        } else {
            return (parent as! UICollectionView).dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
        }
    }
    
    /**
     Instantiate via Dequeing cells(TableViewCell or CollectionViewCells) reusably
     - parameter parent: (TableView or CollectionView) object for which cells are required
     - parameter indexPath: IndexPath for the cell
     */
    static func dequeReusably(for parent: UIDataSourceTranslating, at indexPath: IndexPath) -> Self {
        return cellFor(parent, indexPath)
    }
}

extension UITableViewCell: Registerable { }
extension UICollectionViewCell: Registerable { }

extension UIDataSourceTranslating {
    /**
     Register cells from XIB to your collection or table views
     - parameter cells: Class names of required TableView or Collectionview cells you need to register to your table or collectionview
     */
    func register(cells: Registerable.Type...) {
        if let tableViewCells = cells as? [UITableViewCell.Type] {
            tableViewCells.forEach {
                (self as? UITableView)?.register(UINib(nibName: $0.identifier, bundle: nil),
                                                 forCellReuseIdentifier: $0.identifier)
            }
        } else if let clctionViewCells = cells as? [UICollectionViewCell.Type] {
            clctionViewCells.forEach {
                (self as? UICollectionView)?.register(UINib(nibName: $0.identifier, bundle: nil),
                                                      forCellWithReuseIdentifier: $0.identifier)
            }
        }
    }
    
    /**
     Adds pull to refresh control to a CollectionView
     - parameter selector: A selector to be executed if pull to refresh is triggered
     - parameter control: Instance of UIRefreshControl added
     */
    func addPullToRefresh(with completion: (_ control: UIRefreshControl)-> Void) {
        let refresh = UIRefreshControl()
//        refresh.tintColor = Constants.Colors.blue
        (self as? UICollectionView ?? self as? UITableView)?.refreshControl = refresh
        (self as? UICollectionView ?? self as? UITableView)?.bounces = true
        completion(refresh)
    }
    
    /**
     Last IndexPath of collectionview or tableview
     */
    var lastIndexPath: IndexPath? {
        if let table = self as? UITableView {
            guard table.numberOfSections > 0 else { return nil }
            return IndexPath(row: (table.numberOfRows(inSection: table.numberOfSections - 1) - 1),
                             section:  table.numberOfSections - 1)
        } else if let collection = self as? UICollectionView {
            guard collection.numberOfSections > 0 else { return nil }
            return IndexPath(item: (collection.numberOfItems(inSection: collection.numberOfSections) - 1),
                             section:  collection.numberOfSections - 1)
        } else {
            return nil
        }
    }
}
