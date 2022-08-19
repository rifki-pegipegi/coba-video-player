//
//  VideoView.swift
//  coba-video-player
//
//  Created by Muhammad Rifki Widadi on 18/08/22.
//

import UIKit

class VideoView: UIView {

    lazy var videoPlayer: UIView = {
        let video = UIView()
        video.backgroundColor = .purple
        return video
    } ()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        setupLayoutVideoPlayer()

    }

    func setupLayoutVideoPlayer() {
        self.addSubview(videoPlayer)
        videoPlayer.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            videoPlayer.topAnchor.constraint(equalTo: self.topAnchor),
            videoPlayer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            videoPlayer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            videoPlayer.heightAnchor.constraint(equalToConstant: 300)
        ])

    }


}
