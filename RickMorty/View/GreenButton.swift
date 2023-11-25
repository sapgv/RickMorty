//
//  GreenButton.swift
//  RickMorty
//
//  Created by Grigory Sapogov on 25.11.2023.
//

import UIKit

protocol IActionButton: UIButton {
    
    var action: (() -> Void)? { get set }
    
}

class GreenButton: UIButton, IActionButton {
    
    var action: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}

class RedButton: UIButton, IActionButton {
    
    var action: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}

