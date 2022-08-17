import UIKit

import SnapKit

class Example1ViewController: UIViewController {
    
    let profileImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 35
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 17)
        view.textAlignment = .center
        view.textColor = .white
        view.text = "닉네임닉네임닉네임닉네임닉네임닉sddsfdsfasfdsasdfdsfdsfsd"
        return view
    }()
    
    let stateLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 17)
        view.textAlignment = .center
        view.textColor = .white
        view.text = "상태메시지상태메시지상태메시지상태메시지상태메시지상태메시"
        return view
    }()
    
    let horizontalView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let cancelButton: UIButton = {
       let view = UIButton()
        view.setTitle(nil, for: .normal)
        view.setImage(UIImage(systemName: "xmark"), for: .normal)
        view.tintColor = .white
        return view
    }()
    
    let settingButton: UIButton = {
       let view = UIButton()
        view.setTitle(nil, for: .normal)
        view.setImage(UIImage(systemName: "gearshape.circle"), for: .normal)
        view.backgroundColor = .clear
        view.tintColor = .white
        return view
    }()
    
    let sendMoneyButton: UIButton = {
        let view = UIButton()
        view.setTitle(nil, for: .normal)
        view.setImage(UIImage(systemName: "gearshape.circle"), for: .normal)
        view.backgroundColor = .clear
        view.tintColor = .white
        return view
    }()
    
    let giftButton: UIButton = {
        let view = UIButton()
        view.setTitle(nil, for: .normal)
        view.setImage(UIImage(systemName: "gearshape.circle"), for: .normal)
        view.backgroundColor = .clear
        view.tintColor = .white
        return view
    }()
    
    let chatButton: UIButton = {
        var configuration = UIButton.Configuration.tinted()
        configuration.image = UIImage(systemName: "message.fill")
        configuration.imagePlacement = .top
        configuration.imagePadding = 15
        configuration.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        configuration.subtitle = "나와의 채팅"
        configuration.buttonSize = .large
        configuration.baseBackgroundColor = .systemOrange
        configuration.baseForegroundColor = .white
        let view = UIButton(configuration: configuration, primaryAction: nil)
        return view
    }()
    
    let editButton: UIButton = {
        var configuration = UIButton.Configuration.tinted()
        configuration.image = UIImage(systemName: "pencil")
        configuration.imagePadding = 15
        configuration.imagePlacement = .top
        configuration.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        configuration.subtitle = "프로필 편집"
        configuration.buttonSize = .large
        configuration.baseBackgroundColor = .systemOrange
        configuration.baseForegroundColor = .white
        let view = UIButton(configuration: configuration, primaryAction: nil)
        return view
    }()
    
    let storyButton: UIButton = {
        var configuration = UIButton.Configuration.tinted()
        configuration.image = UIImage(systemName: "book.fill")
        configuration.imagePadding = 15
        configuration.imagePlacement = .top
        configuration.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        configuration.subtitle = "카카오스토리"
        configuration.buttonSize = .large
        configuration.baseBackgroundColor = .systemOrange
        configuration.baseForegroundColor = .white
        let view = UIButton(configuration: configuration, primaryAction: nil)
        return view
    }()
    
    let stackView: UIStackView = {
       let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 5
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        configureUI()
        
        
    }
    
    func configureUI() {
        
        [profileImageView, titleLabel, stateLabel, horizontalView, cancelButton, settingButton, sendMoneyButton, giftButton, stackView].forEach {
            view.addSubview($0)
        }
        
        [chatButton, editButton, storyButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view).offset(150)
//            make.center.equalTo(self.view).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(profileImageView)
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.leadingMargin.equalTo(20) // leading 또는 trailing 하나만 잡아줘도 양쪽에 제약 조건이 추가된다 왜?
            $0.trailingMargin.equalTo(-20)
        }
        
        stateLabel.snp.makeConstraints {
            $0.centerX.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leadingMargin.greaterThanOrEqualTo(20)
            $0.trailingMargin.greaterThanOrEqualTo(-20)
        }
        
        horizontalView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.top.equalTo(stateLabel.snp.bottom).offset(20)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.width.height.equalTo(44) // 한줄로도 가능
//            make.leadingMargin.equalTo(self.view.safeAreaLayoutGuide)
//            make.topMargin.equalTo(self.view.safeAreaLayoutGuide) ~Margin으로 설정하면 safeArea 밖에 위치함
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading) // leading, top으로 설졍하면 safearea 딱 맞게 위치함
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
        
        settingButton.snp.makeConstraints { make in
            make.width.height.equalTo(44)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
        
        sendMoneyButton.snp.makeConstraints { make in
            make.width.height.equalTo(44)
            make.centerY.equalTo(settingButton)
            make.trailing.equalTo(settingButton.snp.leading).offset(-10)
        }
        
        giftButton.snp.makeConstraints { make in
            make.width.height.equalTo(44)
            make.centerY.equalTo(sendMoneyButton)
            make.trailing.equalTo(sendMoneyButton.snp.leading).offset(-10)
        }
        
//        chatButton.snp.makeConstraints { make in
//            make.width.height.equalTo(100)
//            make.center.equalToSuperview()
//        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(40)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-40)
            make.top.equalTo(horizontalView.snp.bottom).offset(20)
            make.height.equalTo(80)
            make.bottom.greaterThanOrEqualTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            
        }
    }
    
    

}
