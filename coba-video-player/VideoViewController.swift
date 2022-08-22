//
//  ViewController.swift
//  coba-video-player
//
//  Created by Muhammad Rifki Widadi on 18/08/22.
//

import UIKit
import AVKit
import YouTubeiOSPlayerHelper

let videoSample = [
    "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8",
    "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
    "https://www.youtube.com/watch?v=yqCJcdFl55I",
    "https://youtube.com/shorts/8Lt1hJnEcq0?feature=share"
]

let url = videoSample[0]

class VideoViewController: UIViewController {

    let videoView = VideoView(url: url)

    override func loadView() {
        self.view = videoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard let avUrl = URL(string: url) else { return }

        let player = AVPlayer(url: avUrl)
        let playerController = AVPlayerViewController()


        if url.contains("youtube") || url.contains("youtu.be") {
            player.pause()
            guard let ytId = extractYouTubeId(from: url) else { return }
            videoView.yTvideoPlayer.load(withVideoId: ytId, playerVars: ["modestbranding": 1, "playsinline": 1])
        } else {
            videoView.yTvideoPlayer.stopVideo()
            playerController.player = player
            self.addChild(playerController)
            videoView.videoPlayer.addSubview(playerController.view)
            playerController.view.frame = videoView.videoPlayer.frame
        }

    }


    func extractYouTubeId(from url: String) -> String? {
        let typePattern = "(?:(?:\\.be\\/|embed\\/|shorts\\/|v\\/|\\?v=|\\&v=|\\/videos\\/)|(?:[\\w+]+#\\w\\/\\w(?:\\/[\\w]+)?\\/\\w\\/))([\\w-_]+)"
        let regex = try? NSRegularExpression(pattern: typePattern, options: .caseInsensitive)
        return regex
            .flatMap { $0.firstMatch(in: url, range: NSMakeRange(0, url.count)) }
            .flatMap { Range($0.range(at: 1), in: url) }
            .map { String(url[$0]) }
    }
}




