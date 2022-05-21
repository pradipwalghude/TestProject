//
//  Storyboard.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import UIKit

enum Storyboard : String {
    case Home = "Main"
}

protocol Storyboarded { }

extension Storyboarded where Self: UIViewController {
    
    static func instantiate(from storyboard: Storyboard) -> Self {
        let storyboardIdentifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle(for: Self.self).resource)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}
