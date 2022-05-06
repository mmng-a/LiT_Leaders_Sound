//
//  ViewController.swift
//  Sound
//
//  Created by Masashi Aso on 2022/05/06.
//

import AVFoundation
import UIKit

struct Instrument: Equatable, Hashable {
  let name: String
  let player: AVAudioPlayer
  var imageName: String { "\(name)Image.png" }
  var playingImageName: String { "\(name)PlayingImage.png" }
  
  init?(name: String) {
    self.name = name
    guard let sound = NSDataAsset(name: "\(name)Sound"),
          let player = try? AVAudioPlayer(data: sound.data) else {
      return nil
    }
    self.player = player
  }
}

extension Instrument {
  func play() {
    player.currentTime = 0
    player.play()
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(name.hashValue)
  }
}


class ViewController: UIViewController {
  
  @IBOutlet var drumButton: UIButton!
  @IBOutlet var pianoButton: UIButton!
  @IBOutlet var guitarButton: UIButton!
  
  let drum = Instrument(name: "drum")!
  let piano = Instrument(name: "piano")!
  let guitar = Instrument(name: "guitar")!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    drumButton.setImage(UIImage(named: drum.imageName), for: .normal)
    drumButton.setImage(UIImage(named: drum.playingImageName), for: .highlighted)
    pianoButton.setImage(UIImage(named: piano.imageName), for: .normal)
    pianoButton.setImage(UIImage(named: piano.playingImageName), for: .highlighted)
    guitarButton.setImage(UIImage(named: guitar.imageName), for: .normal)
    guitarButton.setImage(UIImage(named: guitar.playingImageName), for: .highlighted)
  }
  
  @IBAction func tapDrumButton(sender: UIButton) {
    switch sender {
    case drumButton:   drum.play()
    case pianoButton:  piano.play()
    case guitarButton: guitar.play()
    default:           fatalError()
    }
  }

}
