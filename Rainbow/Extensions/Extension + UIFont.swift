//
//  File.swift
//  Rainbow
//
//  Created by Danila Bolshakov on 13.11.2023.
//

import UIKit.UIFont

extension UIFont {
    
    enum CormorantFont {
        enum RegularItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: SystemFonts.CormorantItalic.italic, size: size) ?? UIFont()
            }
        }
    }
    
    enum DisplayFont {
        enum Regular {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: SystemFonts.Display.regular, size: size) ?? UIFont()
            }
        }
        
        enum Bold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: SystemFonts.Display.bold, size: size) ?? UIFont()
            }
        }
        
        enum Medium {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: SystemFonts.Display.medium, size: size) ?? UIFont()
            }
        }
        
        enum SemiBold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: SystemFonts.Display.semibold, size: size) ?? UIFont()
            }
        }
        
        enum Heavy {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: SystemFonts.Display.heavy, size: size) ?? UIFont()
            }
        }
        
        enum Black {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: SystemFonts.Display.black, size: size) ?? UIFont()
            }
        }
    }
    
    enum TextFont {
        enum Bold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: SystemFonts.Display.bold, size: size) ?? UIFont()
            }
        }
        
        enum Semibold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: SystemFonts.Text.semibold, size: size) ?? UIFont()
            }
        }
        
        enum Regular {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: SystemFonts.Text.medium, size: size) ?? UIFont()
            }
        }
    }
}

extension UIFont {
    enum SystemFonts {
        
        enum CormorantItalic {
           static let italic = "CormorantInfant-Italic"
        }
        
        enum Display {
            static let regular = "SFProDisplay-Regular"
            static let bold = "SFProDisplay-Bold"
            static let medium = "SFProDisplay-Medium"
            static let semibold = "SFProDisplay-Semibold"
            static let heavy = "SFCompactDisplay-Heavy"
            static let black = "SFProDisplay-Black"
        }
        
        enum Text {
            static let regular = "SFProText-Regular"
            static let semibold = "SFProText-Semibold"
            static let medium = "SFProText-Medium"
        }
    }
}

