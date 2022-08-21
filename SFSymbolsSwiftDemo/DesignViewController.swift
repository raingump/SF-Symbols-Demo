//
//  DesignViewController.swift
//  SFSymbolsSwiftDemo
//
//  Created by ganyu on 2022/8/1.
//

import UIKit

class DesignViewController: UIViewController {
    
    let iconW = 150.0
    let padding = 10.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .black
    
        let x = (App.Screen.width - iconW) / 2
        
        // 书
        let imageView1 = createImageView(imageName: "character.book.closed.fill")
        let height1 = iconW * 41.0 / 31.0
        imageView1.frame = CGRect.init(x: x, y: 0, width: iconW, height: height1)

        // 字
        let imageView2 = createImageView(imageName: "character")
        let height2 = iconW * 29.0 / 23.0
        imageView2.frame = CGRect.init(x: x, y: imageView1.frame.maxY + padding, width: iconW, height: height2)
        
        // 大小
        let imageView3 = createImageView(imageName: "textformat.size")
        let height3 = iconW * 29.0 / 42.0
        imageView3.frame = CGRect.init(x: x, y: imageView2.frame.maxY + padding, width: iconW, height: height3)

        // 字气泡
        let imageView4 = createImageView(imageName: "character.bubble.fill")
        let height4 = iconW * 40.0 / 41.0
        imageView4.frame = CGRect.init(x: x, y: imageView3.frame.maxY + padding, width: iconW, height: height4)
    
        view.addSubview(imageView1)
        view.addSubview(imageView2)
        view.addSubview(imageView3)
        view.addSubview(imageView4)
    }
    
    func createImageView(imageName: String) -> UIImageView {
        let imageView = UIImageView.init(image: UIImage(systemName: imageName))
        let config = UIImage.SymbolConfiguration.init(weight: .regular).applying(UIImage.SymbolConfiguration(hierarchicalColor: .systemOrange))
        imageView.preferredSymbolConfiguration = config
        return imageView
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
