//
//  ViewController.swift
//  colorChange
//
//  Created by User04 on 2019/4/21.
//  Copyright © 2019 91910lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var wordsImageView: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var anotherColorSwitch: UISwitch!
    @IBOutlet weak var anotherRedSlider: UISlider!
    @IBOutlet weak var anotherRedLabel: UILabel!
    @IBOutlet weak var anotherGreenSlider: UISlider!
    @IBOutlet weak var anotherGreenLabel: UILabel!
    @IBOutlet weak var anotherBlueSlider: UISlider!
    @IBOutlet weak var anotherBlueLabel: UILabel!
    
    let gradientLayer = CAGradientLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gradientLayer.frame = backgroundView.bounds
    }
    @IBAction func colorSliderChange(_ sender: Any) {
        changeText(red: redLabel, green: greenLabel, blue: blueLabel, redS: redSlider, greenS: greenSlider, blueS: blueSlider)
        if anotherColorSwitch.isOn {
            twoColorChange();
        }
        else{
            oneColorChange();
        }
    }
    @IBAction func anotherSwichChange(_ sender: Any) {
        if anotherColorSwitch.isOn {
            trueOrFalse(answer: true)
            twoColorChange()
        }
        else {
            trueOrFalse(answer: false)
            oneColorChange()
        }
    }
    @IBAction func anotherColorSliderChange(_ sender: Any) {
        changeText(red: anotherRedLabel, green: anotherGreenLabel, blue: anotherBlueLabel, redS: anotherRedSlider, greenS: anotherGreenSlider, blueS: anotherBlueSlider)
        twoColorChange()
    }
    
    @IBAction func randomOneValueChange(_ sender: Any) {
        trueOrFalse(answer: false)
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        alphaSlider.value = Float.random(in: 0...1)
        changeText(red: redLabel, green: greenLabel, blue: blueLabel, redS: redSlider, greenS: greenSlider, blueS: blueSlider)
        oneColorChange()
    }
    @IBAction func randomTwoValueChange(_ sender: Any) {
        trueOrFalse(answer: true)
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        alphaSlider.value = Float.random(in: 0...1)
        changeText(red: redLabel, green: greenLabel, blue: blueLabel, redS: redSlider, greenS: greenSlider, blueS: blueSlider)
        anotherRedSlider.value = Float.random(in: 0...1)
        anotherGreenSlider.value = Float.random(in: 0...1)
        anotherBlueSlider.value = Float.random(in: 0...1)
        changeText(red: anotherRedLabel, green: anotherGreenLabel, blue: anotherBlueLabel, redS: anotherRedSlider, greenS: anotherGreenSlider, blueS: anotherBlueSlider)
        twoColorChange()
    }
    func oneColorChange(){
        gradientLayer.colors = [UIColor(red:CGFloat( redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value)).cgColor, UIColor(red:CGFloat( redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value)).cgColor]
        backgroundView.layer.addSublayer(gradientLayer)
    }
    func twoColorChange(){
        gradientLayer.colors = [UIColor(red:CGFloat( redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value)).cgColor, UIColor(red: CGFloat(anotherRedSlider.value), green: CGFloat(anotherGreenSlider.value), blue: CGFloat(anotherBlueSlider.value), alpha: CGFloat(alphaSlider.value)).cgColor]
        backgroundView.layer.addSublayer(gradientLayer)
    }
    func changeText(red: UILabel, green: UILabel, blue: UILabel, redS: UISlider, greenS: UISlider, blueS: UISlider){
        red.text = String(format: "%.3f", redS.value)
        green.text = String(format: "%.3f", greenS.value)
        blue.text = String(format: "%.3f", blueS.value)
        alphaLabel.text = String(format: "%.3f", alphaSlider.value)
    }
    func trueOrFalse(answer: Bool){
        anotherColorSwitch.isOn = answer
        anotherRedSlider.isEnabled = answer
        anotherGreenSlider.isEnabled = answer
        anotherBlueSlider.isEnabled = answer
    }
}

