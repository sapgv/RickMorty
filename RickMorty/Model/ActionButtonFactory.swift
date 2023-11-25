//
//  ActionButtonFactory.swift
//  RickMorty
//
//  Created by Grigory Sapogov on 25.11.2023.
//

import UIKit

class ActionButtonFactory {

    var color: UIColor
    
    init(color: UIColor) {
        self.color = color
    }
    
    func createActionButton() -> IActionButton {
        
        switch self.color {
        case .systemGreen:
            return GreenButton()
        case .red:
            return RedButton()
        default:
            return GreenButton()
        }
        
    }
    
}
