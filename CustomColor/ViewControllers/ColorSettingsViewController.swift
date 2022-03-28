//
//  ViewController.swift
//  CustomColor
//
//  Created by Евгений Волошенко on 18.03.2022.
//

import UIKit

class ColorSettingsViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!

    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var mainColor: UIColor!
    var delegate: ColorSettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeColorSettings()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func doneButtonPressed() {
        guard let color = colorView.backgroundColor else { return }
        delegate.setBackground(color: color)
        dismiss(animated: true)
    }
    
    
    @IBAction func valueChanged() {
        updateColor()
        updateLabelValue()
        updateTextFieldValue()
    }
    
    private func changeColorSettings() {
        redSlider.value = Float(mainColor.redValue)
        greenSlider.value = Float(mainColor.greenValue)
        blueSlider.value = Float(mainColor.blueValue)
        
        valueChanged()
    }
    
    private func updateColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func updateLabelValue() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func updateTextFieldValue() {
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", blueSlider.value)
        blueTextField.text = String(format: "%.2f", greenSlider.value)
    }
    
    private func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    
        updateTextFieldValue()
    }
}

extension ColorSettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let textFiledText = textField.text,
              let textFieldFloatValue = Float(textFiledText) else {
            showAlert(with: "Error", message: "Incorrect value")
            return
        }
        
        switch textField {
        case redTextField:
            redSlider.value = textFieldFloatValue
        case greenTextField:
            greenSlider.value = textFieldFloatValue
        case blueTextField:
            blueSlider.value = textFieldFloatValue
        default:
            showAlert(with: "Error", message: "Try again")
        }
        
        valueChanged()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
