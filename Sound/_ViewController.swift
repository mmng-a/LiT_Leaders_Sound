//
//  ViewController.swift
//  Sound
//
//  Created by Masashi Aso on 2022/05/06.
//

import AVFoundation
import UIKit

// こっちは趣味です
private struct Instrument: Equatable, Hashable {
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


class _ViewController: UIViewController {
  
  @IBOutlet var drumButton: UIButton!
  @IBOutlet var pianoButton: UIButton!
  @IBOutlet var guitarButton: UIButton!
  
  private let drum = Instrument(name: "drum")!
  private let piano = Instrument(name: "piano")!
  private let guitar = Instrument(name: "guitar")!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setImage(for: drum, to: drumButton)
    setImage(for: piano, to: pianoButton)
    setImage(for: guitar, to: guitarButton)
  }
  
  private func setImage(for instrument: __shared Instrument, to button: UIButton) {
    button.setImage(UIImage(named: instrument.imageName), for: .normal)
    button.setImage(UIImage(named: instrument.playingImageName), for: .highlighted)
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
