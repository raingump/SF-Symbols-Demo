//
//  LineWeightViewController.swift
//  SFSymbolsSwiftDemo
//
//  Created by ganyu on 2022/8/1.
//

import UIKit

class LineWeightViewController: UIViewController {
    
    let iconW = 300.0
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView.init(image: UIImage.init(systemName: "thermometer.sun.fill"))
        imageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration.preferringMulticolor()
            .applying(UIImage.SymbolConfiguration.init(weight: .regular))
                .applying(UIImage.SymbolConfiguration.init(scale: .small))
        imageView.frame = CGRect.init(x: (App.Screen.width - iconW) / 2, y: 100, width: iconW, height: iconW * 52 / 38)
        return imageView
    }()
    
    private lazy var weightSlider: UISlider = {
        let slider = UISlider()
        slider.frame = CGRect.init(x: 50, y: imageView.frame.maxY + 100, width: App.Screen.width - 50 * 2, height: 30)
        slider.minimumValue = 1
        slider.maximumValue = 9.9
        slider.isContinuous = false
        slider.minimumTrackTintColor = UIColor(red: 255/255.0, green: 191/255.0, blue: 0/255.0, alpha: 1)
        slider.maximumTrackTintColor = UIColor(red: 255/255.0, green: 95/255.0, blue: 31/255.0, alpha: 1)
        slider.addTarget(self, action: #selector(sliderChanged(sender:)), for: .valueChanged)
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        
        view.addSubview(weightSlider)
        weightSlider.setValue(4, animated: false)
                        
        
        view.addSubview(imageView)
                
    }
    
    @objc func sliderChanged(sender: UISlider) {
        let value = Int(sender.value)
        
        if sender.isEqual(weightSlider) {
            sender.setValue(Float(roundf(sender.value * 9.0) / 9.0), animated: true)
            
            var config = imageView.preferredSymbolConfiguration
            let weight: UIImage.SymbolWeight = UIImage.SymbolWeight(rawValue: value) ?? .medium
            
            // 修改重量
            config = config?.applying(UIImage.SymbolConfiguration.init(weight: weight))
            imageView.preferredSymbolConfiguration = config
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
