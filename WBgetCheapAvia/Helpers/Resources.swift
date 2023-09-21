//
//  Resources.swift
//  WorkoutApp
//
//  Created by Mikhail Ustyantsev on 06.09.2023.
//

import UIKit

enum R {
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inactive = UIColor(hexString: "#929DA5")
        
        static let background = UIColor(hexString: "#F8F9F9")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let secondary = UIColor(hexString: "#F0F3FF")
        
        static let titleGrey = UIColor(hexString: "#545C77")
        static let subtitleGrey = UIColor(hexString: "#D8D8D8")
    }
    
    enum Strings {
        enum Main {
            static let cellIdentifier = "FlightTableViewCell"
        }
        
        enum Detail {
            static let stepsCounter = "Steps Counter"
        }
        
    }
    
    enum Images {
        enum FlightTableViewCell {
            static let arrow = UIImage(named: "directionArrow")
            static let liked = UIImage(named: "heart.fill")
            static let unliked = UIImage(named: "heart")
        }
        
        enum Common {
            static let downArrow = UIImage(named: "down_arrow")
            static let add = UIImage(named: "add_button")
        }
        
    }
    
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
        
        static func helveticaBold(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica-Bold", size: size) ?? UIFont()
        }
    }
    
    
    enum Keys {
        static let defaults = "favorites"
    }
    
    
}
