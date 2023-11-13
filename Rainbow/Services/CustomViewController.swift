//
//  CustomViewController.swift
//  Rainbow
//
//  Created by Sergey on 12.11.2023.
//

import Foundation
import UIKit

class CustomViewController<V: CustomView>: UIViewController {
    
    override func loadView() {
        view = V()
    }
    
    // To access view use this computed property
    var customView: V {
        view as! V
    }
}
