//
//  Storyboard+Utility.swift
//  Makestagram
//
//  Created by William Fernandes on 7/18/18.
//  Copyright © 2018 William Fernandes. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    enum PMType: String {
        
        //case main
        case time
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    convenience init(type: PMType, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle: bundle)
    }
    
    static func initialViewController(for type: PMType) -> UIViewController {
        
        let storyboard = UIStoryboard(type: type)
        
        guard let initialViewContoller = storyboard.instantiateInitialViewController() else {
            fatalError("Couldn't instantiate initial view controller for \(type.filename) storyboard.")
        }
        
        return initialViewContoller
    }
}
