
import UIKit
import SnapKit

class CodeSnapViewController: UIViewController {
    
    let photoImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let titleTextField: UITextField = {
        print("TextField")
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    let dateTextField: UITextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "날짜를 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    let contentTextView: UITextView = {
        let view = UITextView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#function)

        view.addSubview(titleTextField)
        view.addSubview(dateTextField)
        view.addSubview(contentTextView)
        
        configureUI()
        
    }

    
    func configureUI() {
        
        //for-in vs foreach(클로저를 파라미터로 받는다, 고차함수)
        // 뷰객체가 많아지면 addSubview 코드를 많이 작성해야 한다. 따라서 반복문 foreach 사용
//        view.addSubview(photoImageView)
//        photoImageView.translatesAutoresizingMaskIntoConstraints = false // 스냅킷 내부에 적용되서 주석처리
        
        [photoImageView, titleTextField, dateTextField, contentTextView].forEach {
            view.addSubview($0)
        }
        
//        photoImageView.backgroundColor = .lightGray
//        photoImageView.contentMode = .scaleAspectFill
        
//        titleTextField.borderStyle = .none
//        titleTextField.layer.borderColor = UIColor.black.cgColor
//        titleTextField.layer.borderWidth = 1
//        titleTextField.placeholder = "제목을 입력해주세요"
//        titleTextField.textAlignment = .center
//        titleTextField.font = .boldSystemFont(ofSize: 15)
        
        // 달라지지 않는 UI들은 위처럼 작성해도 되지만 변하지 않는 데이터들은 viewDidLoad()시점에 변경해줄건가, UI인스턴스를 생성할 때 등록해줄건가
        // 클로저 구문을 활용하면 한 번에 정리할 수 있다.
        
        // 스냅킷 활용
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(view).multipliedBy(0.3) // 뷰 높이 비율로
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20) // 오프셋(간격)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        contentTextView.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    
    }
}
