//
//  ColorViewController.swift
//  CustomColor
//
//  Created by Евгений Волошенко on 27.03.2022.
//

import UIKit

protocol ColorSettingsViewControllerDelegate {
    var currentBackgroundColor: UIColor { get }
    func setBackground(color: UIColor)
}

class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorSettingsVC = segue.destination as? ColorSettingsViewController else { return }
        colorSettingsVC.delegate = self
    }
}

extension ColorViewController: ColorSettingsViewControllerDelegate {
    var currentBackgroundColor: UIColor {
        view.backgroundColor ?? .systemGray
    }
    func setBackground(color: UIColor) {
        view.backgroundColor = color
    }
}
