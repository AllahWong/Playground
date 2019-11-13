import Foundation
import UIKit

public class ViewController1: UIViewController {
    public override func viewDidLoad(){
        super.viewDidLoad()
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.setTitle("点击跳转", for: .normal)
        button.setTitleColor(.yellow, for: .selected)
        button.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
        view.addSubview(button)
        view.backgroundColor = .blue
    }
    
    @objc func touchButton() {
        navigationController?.pushViewController(ViewController2(), animated: true)
    }
    
}

