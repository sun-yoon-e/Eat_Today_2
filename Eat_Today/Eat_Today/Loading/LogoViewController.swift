//
//  ViewController.swift
//  Eat_Today
//

import UIKit

class LogoViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 327, height: 155))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.animate()
        })
    }
    
    private func animate() {
        UIView.animate(withDuration: 2, animations: {
            let size = self.view.frame.size.width * 2
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(x: -(diffX / 2), y: diffY/2, width: size, height: size)
        })
        
        UIView.animate(withDuration: 1,
                       animations: { self.imageView.alpha = 0 },
                       completion: { done in
                            if done {
                                DispatchQueue.main.asyncAfter(deadline: .now()+0.3, execute: {
                                    let Home = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "Home")
                                    Home.modalPresentationStyle = .fullScreen
                                    self.present(Home, animated: true, completion: nil)
                })
            }
        })
    }
}
