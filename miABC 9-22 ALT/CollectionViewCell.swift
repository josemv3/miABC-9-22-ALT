//
//  CollectionViewCell.swift
//  miABC 9-22 ALT
//
//  Created by Joey Rubin on 8/29/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let reusidentifier = String(describing: CollectionViewCell.self)
    
    @IBOutlet var cellLabel: UILabel!
}
