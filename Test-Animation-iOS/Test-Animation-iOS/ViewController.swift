//
//  ViewController.swift
//  Test-Animation-iOS
//
//  Created by 이조은 on 2023/09/11.
//

import UIKit

import SnapKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {
    let gotoGif: UIButton = {
        let button = UIButton()
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(nextGif), for: .touchUpInside)

        return button
    }()

    @objc
    func nextGif() {
        print("=== nextGif")
        let nextViewController = GifViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        setViewHierarchy()
        setConstraints()
        setButtonConfig()
        buttonTap()
    }

    func setViewHierarchy() {
        self.view.addSubview(gotoGif)
    }

    func setConstraints() {
        gotoGif.snp.makeConstraints {
            $0.top.equalToSuperview().inset(211)
            $0.centerX.equalToSuperview()
        }
    }

    func setButtonConfig() {
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 7
        buttonConfiguration.baseForegroundColor = .black

        var titleGif = AttributedString.init("GIF로 테스트")
        titleGif.font = UIFont(name: "Roboto-Bold", size: 11)
        buttonConfiguration.attributedTitle = titleGif
        gotoGif.configuration = buttonConfiguration
    }

    private func buttonTap() {
        //        gotoGif.rx.tap
        //            .bind {
        //                print("123123")
        //                let nextViewController = GifViewController()
        //                self.navigationController?.pushViewController(nextViewController, animated: true)
        //            }.disposed(by: disposeBag)
        //        goto3D.rx.tap
        //            .bind {
        //                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "3DViewController")
        //                self.navigationController?.pushViewController(pushVC!, animated: true)
        //            }.disposed(by: disposeBag)
    }
}

