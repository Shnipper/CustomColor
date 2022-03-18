//
//  ViewController.swift
//  CustomColor
//
//  Created by Евгений Волошенко on 18.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!

    @IBOutlet weak var redPoints: UILabel!
    @IBOutlet weak var greenPoints: UILabel!
    @IBOutlet weak var bluePoints: UILabel!

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redPoints.text = String(round(redSlider.value * 100) / 100)
        greenPoints.text = String(round(greenSlider.value * 100) / 100)
        bluePoints.text = String(round(blueSlider.value * 100) / 100)
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        redPoints.text = String(round(redSlider.value * 100) / 100)
        colorChanged()
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenPoints.text = String(round(greenSlider.value * 100) / 100)
        colorChanged()
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        bluePoints.text = String(round(blueSlider.value * 100) / 100)
        colorChanged()
    }

    private func colorChanged() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
}
