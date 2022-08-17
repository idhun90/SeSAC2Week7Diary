//
//  WalkingThroughViewController.swift
//  SeSAC2Week7Diary
//
//  Created by 이도헌 on 2022/08/16.
//

import UIKit

class WalkingThroughViewController: UIPageViewController {

    //1. 뷰컨트롤러 배열 생성
    var pageViewControllerList: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        createPageViewController()
        configurePageViewController()
    }
    
    //2. 배열에 뷰컨트롤러 추가.
    func createPageViewController() {
        let sb = UIStoryboard(name: "WalkThrough", bundle: nil)
        let vc1 = sb.instantiateViewController(withIdentifier: FirstViewController.reuseIdentifier) as! FirstViewController
        let vc2 = sb.instantiateViewController(withIdentifier: SecondViewController.reuseIdentifier) as! SecondViewController
        let vc3 = sb.instantiateViewController(withIdentifier: ThirdViewController.reuseIdentifier) as! ThirdViewController
        pageViewControllerList = [vc1, vc2, vc3]
    }
    
    //3.
    func configurePageViewController() {
        delegate = self
        dataSource = self
        
        //display하고자 하는 뷰 확인 후 시작점을 만들어줘야 함
        guard let first = pageViewControllerList.first else { return }
        setViewControllers([first], direction: .forward, animated: true)
    }
}
//4.
extension WalkingThroughViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // 현재 페이지뷰컨트롤러에 보이는 뷰컨트롤러의 인덱스 가져오기
        guard let viewControllerIndex = pageViewControllerList.firstIndex(of: viewController) else { return nil }
        //firstIndex(of:)는 of의 처음 인덱스( 중복이 있을 수 있기 때문에)
        
        let previousIndex = viewControllerIndex - 1
        
        return previousIndex < 0 ? nil : pageViewControllerList[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        // 현재 페이지뷰컨트롤러에 보이는 뷰컨트롤러의 인덱스 가져오기
        guard let viewControllerIndex = pageViewControllerList.firstIndex(of: viewController) else { return nil }
        //firstIndex(of:)는 of의 처음 인덱스( 중복이 있을 수 있기 때문에)
        
        let nextIndex = viewControllerIndex + 1
        
        return nextIndex >= pageViewControllerList.count ? nil : pageViewControllerList[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageViewControllerList.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let first = viewControllers?.first, let index = pageViewControllerList.firstIndex(of: first) else { return 0 }
        print("====", index)
        return index
    }
    
    
}
