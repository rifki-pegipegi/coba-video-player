//
//  VideoView.swift
//  coba-video-player
//
//  Created by Muhammad Rifki Widadi on 18/08/22.
//

import UIKit
import AVKit
import YouTubeiOSPlayerHelper

class VideoView: UIView {

    let url: String?

    required init(url: String) {
        self.url = url
        super.init(frame: CGRect.zero)
        self.backgroundColor = .white
        setupView()
    }

    lazy var videoPlayer: UIView = {
        let video = UIView()
        video.backgroundColor = .purple
        return video
    } ()

    lazy var yTvideoPlayer: YTPlayerView = {
        let video = YTPlayerView()
        return video
    } ()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        guard let url = url else { return }

        if url.contains("youtube") || url.contains("youtu.be") {
            setupLayoutVideoPlayer(view: yTvideoPlayer)
        } else {
            setupLayoutVideoPlayer(view: videoPlayer)
        }


    }


    func setupLayoutVideoPlayer(view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.heightAnchor.constraint(equalToConstant: 300)
        ])

    }


}
