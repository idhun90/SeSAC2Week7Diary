import UIKit


/*
 공통
 1. 뷰 객체 프로퍼티 선언, 클래스의 인스턴스를 생성
 2. 명시적으로 루트뷰에 추가
 3. 크기, 위치 및 속성 정의
    : Frame 기반 한계 있음.(SafeArea, 수치 관리(UIScreen.main.bounds.width 등), 해상도 관리 어려움
    -> AutoResizingMask, AutoLayout 등장
    -> NSLayoutConstraints(코드로 제약 조건 설정)
 */

class CodeViewController: UIViewController {

    //1. 뷰객체 프로퍼티 선언. 클래스의 인스턴스를 생성
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //2. 명시적으로 루트뷰에 추가, 루트뷰에 추가해주는 과정이 필요.
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signButton)
        
        //Frame 기반
        //3. 속성 정의 (크기, 위치 등)
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
        emailTextField.borderStyle = .line
        emailTextField.backgroundColor = .lightGray
        
        //NSLayoutConstraints
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = .systemOrange
//        let top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 100)
//        top.isActive = true // 레이아웃에 대한 활성화 (디폴트 false)
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: emailTextField, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
        
        //3. NSLayoutConstraints addConstraints 메소드 등장
        let top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 100)
        
        let leading = NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50)
        
        let trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: emailTextField, attribute: .trailing, multiplier: 1, constant: -50)
        
        let height = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60)
        
        view.addConstraints([top, leading, trailing, height])
        
        
        //4. NSLayoutAnchor
        signButton.translatesAutoresizingMaskIntoConstraints = false
        signButton.backgroundColor = .systemBlue
        
        NSLayoutConstraint.activate([
            signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signButton.widthAnchor.constraint(equalToConstant: 300),
            signButton.heightAnchor.constraint(equalToConstant: 50),
            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }

}
