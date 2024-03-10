//
//  ColorLabelFactory.swift
//  Rainbow
//
//  Created by Sergey on 06.03.2024.
//

import UIKit

protocol ColorLabel: AnyObject {

    var shadowColorLabel: UILabel {get}
    
}

extension UILabel: ColorLabel {
    
    var shadowColorLabel: UILabel {
       return self
    }
    
}

class ColorLabelFactory {

    let colors: [String] = ["красный", "серый", "чёрный", "синий", "коричневый", "фиолетовый", "зелёный"]
    
    static func createShadowLabel() -> ColorLabel {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.layer.shadowOffset = CGSize(width: 0, height: 4)
        label.layer.shadowOpacity = 0.9
        label.layer.shadowRadius = 3
        label.layer.shadowColor = UIColor.black.cgColor
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    
    func getRandomColor() -> String {
        
        return colors[Int.random(in: 0 ... colors.count-1)]
        
    }
    
    func getColor(_ index: Int) -> String {
        
        return colors[index]
        
    }
    
    func getCurentIndex(_ color: String) -> Int {
        
        let index: Int = colors.firstIndex(of: color) ?? 0
        
        return index
        
    }
    
    
    
}

