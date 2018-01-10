//
//  Reusable.swift
//  SimpleHelpers
//
//  Created by David Martin on 1/9/18.
//  Copyright © 2018 dm Apps. All rights reserved.
//

import Foundation
import UIKit

// Protocol to simplify registering cells for UITableView/UICollectionView

protocol Reusable: class {
	static var reuseIdentifier: String { get }
}

extension Reusable {
	static var reuseIdentifier: String {
		return String(describing: self)
	}
}

extension UITableViewCell: Reusable { }

extension UITableViewHeaderFooterView: Reusable { }

extension UICollectionViewCell: Reusable { }
