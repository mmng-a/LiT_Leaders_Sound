//
//  ViewController.swift
//  Sound
//
//  Created by Masashi Aso on 2022/05/06.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var drumButton: UIButton!
  @IBOutlet var pianoButton: UIButton!
  @IBOutlet var guitarButton: UIButton!
  
  let drumPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "drumSound")!.data)
  let pianoPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "pianoSound")!.data)
  let guitarPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "guitarSound")!.data)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // 通常時同様、押下時のイメージもUIImage.setImage(,for:)にて設定できる
    // 教科書にはIBActionに種類があることを伝えたい意図があると考えたが、
    // 筋が非常に悪いため、こちらにした。
    drumButton.setImage(UIImage(named: "drumImage.png"), for: .normal)
    drumButton.setImage(UIImage(named: "drumPlayingImage.png"), for: .highlighted)
    pianoButton.setImage(UIImage(named: "pianoImage.png"), for: .normal)
    pianoButton.setImage(UIImage(named: "pianoPlayingImage.png"), for: .highlighted)
    guitarButton.setImage(UIImage(named: "guitarImage.png"), for: .normal)
    guitarButton.setImage(UIImage(named: "guitarPlayingImage.png"), for: .highlighted)
  }
  
  @IBAction func tapDrumButton(sender: UIButton) {
    drumPlayer.currentTime = 0
    drumPlayer.play()
  }
  
  @IBAction func tapPianoButton(sender: UIButton) {
    pianoPlayer.currentTime = 0
    pianoPlayer.play()
  }
  
  @IBAction func tapGuitarButton(sender: UIButton) {
    guitarPlayer.currentTime = 0
    guitarPlayer.play()
  }
  
}
