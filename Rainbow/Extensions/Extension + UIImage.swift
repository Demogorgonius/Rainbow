//
//  Extension + UIImage.swift
//  Rainbow
//
//  Created by Danila Bolshakov on 16.11.2023.
//

import UIKit.UIImage

extension UIImage {
    enum LTechImage {
        static var backArrow: UIImage? {
            return UIImage(named: "backArrow")
        }
        
        static var checkboxBlack: UIImage? {
            return UIImage(named: "checkboxBlack")
        }
        
        static var checkboxWhire: UIImage? {
            return UIImage(named: "checkboxWhire")
        }
        
        static var image: UIImage? {
            return UIImage(named: "Image")
        }
        
        static var info: UIImage? {
            return UIImage(named: "info")
        }
        
        static var settings: UIImage? {
            return UIImage(named: "settings")
        }
    }
}
