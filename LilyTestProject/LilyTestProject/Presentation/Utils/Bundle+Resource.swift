//
//  Bundle+Resource.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import Foundation

 extension Bundle {
     var resource: Bundle {
        // static framework
        if let resourceURL = resourceURL,
            let resourceBundle = Bundle(url: resourceURL.appendingPathComponent(ModuleName.name + ".bundle")) {
            return resourceBundle
        } else {
        // dynamic framework
            return self
        }
     }
 }

private struct ModuleName {
    static var name: String = {
        String(reflecting: ModuleName.self).components(separatedBy: ".").first ?? ""
    }()
}
