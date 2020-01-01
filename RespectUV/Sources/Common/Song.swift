//
//  Song.swift
//  RespectUV
//
//  Created by Presto on 2019/12/31.
//  Copyright © 2019 presto. All rights reserved.
//

struct Song {
  struct Button {
    let _4b: Difficulty
    let _5b: Difficulty
    let _6b: Difficulty
    let _8b: Difficulty
  }

  struct Difficulty {
    let normal: Int?
    let hard: Int?
    let maximum: Int?
    let sc: Int?
  }

  let title: LocalizedString
  let composer: String
  let bpm: BPM
  let difficulty: Button
}
