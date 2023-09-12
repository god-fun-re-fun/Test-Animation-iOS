//
//  GifViewController.swift
//  Test-Animation-iOS
//
//  Created by 이조은 on 2023/09/12.
//

import Foundation

import UIKit
import SnapKit
import Gifu

final class GifViewController: UIViewController {
    let gifImageView: GIFImageView = {
        let imageView = GIFImageView()
        return imageView
    }()

    let changeButton: UIButton = {
        let button = UIButton()
        button.setTitle("GIF 바꾸기", for: .normal)
        button.layer.cornerRadius = 8
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(changeGIF), for: .touchUpInside)

        return button
    }()

    @objc
    func changeGIF() {
        self.gifImageView.prepareForAnimation(withGIFNamed: "wallaceGif2") {
            print("==== 2")
        }
        // [애니메이션 동작 수행]
        self.gifImageView.animate(withGIFNamed: "gifufigure", animationBlock:  { })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        DispatchQueue.main.async {
            // [애니메이션 준비 상태 확인]
            self.gifImageView.prepareForAnimation(withGIFNamed: "wallaceGif1") {
                print("==== 1")
            }
            // [애니메이션 동작 수행]
            self.gifImageView.animate(withGIFNamed: "gifufigure", animationBlock:  { })
        }

        setHierarchy()
        setConstraints()
    }

    func setHierarchy() {
        self.view.addSubview(gifImageView)
        self.view.addSubview(changeButton)
    }

    func setConstraints() {
        gifImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(464)
            $0.height.equalTo(348)
        }
        changeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(15)
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
    }
}
