import UIKit
import UIFramework

class ViewController: UIViewController {
    
    var name = "고래밥"
    
    private var age = 22

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 화면 전환 코드
        let vc = Example1ViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        
        testOpen()
        //얼럿
//        showAlert(title: "테스트 얼럿", message: "테스트 메시지", buttonTitle: "변경") { _ in
//            self.view.backgroundColor = .lightGray
//        }
        //액티브티 띄우기
//        let image = UIImage(systemName: "star.fill")!
//        let shareURL = "https://www.apple.com"
//        let text = "가나다라마바사"
//
//        sesacShowActivityViewController(shareImage: image, shareURL: shareURL, shareText: text)
        
        OpenWebView.presentWebViewController(self, url: "https://www.naver.com", transitionStyle: .present)
        
        
    }


}

