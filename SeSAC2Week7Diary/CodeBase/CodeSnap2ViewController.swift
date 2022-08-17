//
//  CodeSnap2ViewController.swift
//  SeSAC2Week7Diary
//
//  Created by 이도헌 on 2022/08/17.
//

import UIKit
import SnapKit

class CodeSnap2ViewController: UIViewController {

    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let yellow: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [redView, blackView] .forEach { // 레이어 기준 동일 선상
            view.addSubview($0)
        }
        
        redView.addSubview(yellow) // 레이어 기준 안 쪽에 배치하고 싶을 때
        // containerView, stackView는 addSubview가 아닌 다른 메소드를 사용함. -> 알아보셈
        
        
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view)
    
        }
        
        blackView.snp.makeConstraints { make in
            make.edges.equalTo(redView).inset(50)
            
            
        }

    }
    

}
