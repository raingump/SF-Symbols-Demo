//
//  ColorViewController.swift
//  SFSymbolsSwiftDemo
//
//  Created by ganyu on 2022/8/1.
//

import UIKit

class ColorViewController: UIViewController {

    let iconW = 150.0
    let padding = 10.0
    let labelW = 150.0
    let labelH = 50.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        
        let x = (App.Screen.width - iconW - labelW - padding) / 2 + labelW + padding
        
        // 极细
        let imageView1 = createImageView(config: UIImage.SymbolConfiguration(weight: .ultraLight))
        imageView1.frame = CGRect.init(x: x, y: 0 * (iconW + padding), width: iconW, height: iconW)
        let label1 = createLabel(text: String(localized: "monochrome"), imageView: imageView1)
        
        // 轻
        let imageView2 = createImageView(config: UIImage.SymbolConfiguration.init(hierarchicalColor: .systemBlue).applying(UIImage.SymbolConfiguration(weight: .light)))
        imageView2.frame = CGRect.init(x: x, y: 1 * (iconW + padding), width: iconW, height: iconW)
        let label2 = createLabel(text: String(localized: "hierarchical"), imageView: imageView2)
        
        // 半粗
        let imageView3 = createImageView(config: UIImage.SymbolConfiguration.init(paletteColors: [.systemTeal, .red, .brown]).applying(UIImage.SymbolConfiguration(weight: .black)))
        imageView3.frame = CGRect.init(x: x, y: 2 * (iconW + padding), width: iconW, height: iconW)
        let label3 = createLabel(text: String(localized: "palette"), imageView: imageView3)

        // 黑体
        let imageView4 = createImageView(config: UIImage.SymbolConfiguration.preferringMulticolor().applying(UIImage.SymbolConfiguration(weight: .black)))
        imageView4.frame = CGRect.init(x: x, y: 3 * (iconW + padding), width: iconW, height: iconW)
        let label4 = createLabel(text: String(localized: "multi_color"), imageView: imageView4)
    
        view.addSubview(imageView1)
        view.addSubview(label1)
        view.addSubview(imageView2)
        view.addSubview(label2)
        view.addSubview(imageView3)
        view.addSubview(label3)
        view.addSubview(imageView4)
        view.addSubview(label4)
        
    }
    
    func createImageView(config: UIImage.SymbolConfiguration) -> UIImageView {
        let imageView = UIImageView.init(image: UIImage.init(systemName: "cloud.sun.rain.fill"))
        imageView.preferredSymbolConfiguration = config
        return imageView
    }
    
    func createLabel(text: String, imageView: UIImageView) -> UILabel {
        let label = UILabel(frame: CGRect.init(x: imageView.frame.minX - (labelW + padding), y: imageView.frame.minY + (iconW - labelH) / 2, width: labelW, height: labelH))
        label.text = text
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
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
