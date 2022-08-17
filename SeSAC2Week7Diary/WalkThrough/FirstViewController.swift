
import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var tutorialLabel: UILabel!
    @IBOutlet weak var blackViewWidth: NSLayoutConstraint!
    @IBOutlet weak var aniImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tutorialLabel.alpha = 0
        tutorialLabel.numberOfLines = 0
        tutorialLabel.font = .boldSystemFont(ofSize: 25)
        tutorialLabel.text = """
        일기 씁시다!
        잘 써봅시다!
        """
        
        blackView.backgroundColor = .black
        blackView.alpha = 0
        
        UIView.animate(withDuration: 3) {
            self.tutorialLabel.alpha = 1
            //self.tutorialLabel.backgroundColor = .yellow
        } completion: { _ in
//            self.animateBlackView()
        }
        animateBlackView()
        animateImageView()
    }
//
//    func animateBlackView() {
//
//        UIView.animate(withDuration: 2, delay: 3, options: <#T##UIView.AnimationOptions#>) {
//            self.blackViewWidth.constant += 250
//            self.blackView.alpha = 1
//            self.blackView.layoutIfNeeded()
//        } completion: { _ in
//
//        }
//    }
    //0817
    func animateBlackView() {
        UIView.animate(withDuration: 2) {
            self.blackView.transform = CGAffineTransform(scaleX: 3, y: 1)
            self.blackView.alpha = 1
        } completion: { _ in
            
        }
    }
    
    func animateImageView() {
        
        UIWindow.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
            self.aniImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        } completion: { _ in
            
        }

    }

}
