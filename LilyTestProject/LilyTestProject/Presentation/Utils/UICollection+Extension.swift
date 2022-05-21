//
//  UICollection+Extension.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import Foundation
import UIKit

extension UICollectionView {
    func registerEmptyCell() {
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
    }
    
    func emptyCell(at indexPath: IndexPath) -> UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
    }
}
