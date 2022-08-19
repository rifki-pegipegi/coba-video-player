//
//  ViewController.swift
//  coba-video-player
//
//  Created by Muhammad Rifki Widadi on 18/08/22.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {

    let videoView = VideoView()

    let videoSample = [
        "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8",
        "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
        "https://www.youtube.com/watch?v=yqCJcdFl55I"
    ]

    override func loadView() {
        self.view = videoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let url = URL(string: videoSample[0]) else { return }

        let asset = AVAsset(url: url)
        let item = AVPlayerItem(asset: asset)
        let player = AVPlayer(playerItem: item)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.addChild(playerController)
        videoView.videoPlayer.addSubview(playerController.view)
        playerController.view.frame = videoView.videoPlayer.frame
    }


}

extension AVAsset {

    func generateThumbnail(completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            let imageGenerator = AVAssetImageGenerator(asset: self)
            let time = CMTime(seconds: 0.0, preferredTimescale: 600)
            let times = [NSValue(time: time)]
            imageGenerator.generateCGImagesAsynchronously(forTimes: times, completionHandler: { _, image, _, _, _ in
                if let image = image {
                    completion(UIImage(cgImage: image))
                } else {
                    completion(nil)
                }
            })
        }
    }
}



