//
//  BaseVC.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import Foundation
import UIKit

protocol CustomViewController {
    func setTitle(_ title: String)
}

extension CustomViewController where Self: UIViewController {
    func setTitle(_ title: String) {
        self.title = title
    }
}
