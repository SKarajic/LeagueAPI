//
//  ChampionsDetails.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ChampionsDetails: Decodable {
    
    public var championId: ChampionId
    public var championIdName: String
    public var name: String
    public var title: String
    public var presentationText: String
    public var tags: [String]
    public var ressourceType: RessourceType
    public var stats: ChampionStats
    public var difficulties: ChampionDifficulties
    
    enum CodingKeys: String, CodingKey {
        case championIdName = "id"
        case championId = "key"
        case name = "name"
        case title = "title"
        case presentationText = "blurb"
        case tags = "tags"
        case ressourceType = "partype"
        case stats = "stats"
        case difficulties = "info"
    }
    
    public init(championId: ChampionId, championIdName: String, name: String, title: String, presentationText: String, tags: [String], ressourceType: RessourceType, stats: ChampionStats, difficulties: ChampionDifficulties) {
        self.championId = championId
        self.championIdName = championIdName
        self.name = name
        self.title = title
        self.presentationText = presentationText
        self.tags = tags
        self.ressourceType = ressourceType
        self.stats = stats
        self.difficulties = difficulties
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.championId = try ChampionId(container.decode(String.self, forKey: .championId))!
        self.championIdName = try container.decode(String.self, forKey: .championIdName)
        self.name = try container.decode(String.self, forKey: .name)
        self.title = try container.decode(String.self, forKey: .title)
        self.presentationText = try container.decode(String.self, forKey: .presentationText)
        self.tags = try container.decode([String].self, forKey: .tags)
        let ressourceTypeStr: String = try container.decode(String.self, forKey: .ressourceType)
        self.ressourceType = RessourceType(ressourceTypeStr)
        self.stats = try container.decode(ChampionStats.self, forKey: .stats)
        self.difficulties = try container.decode(ChampionDifficulties.self, forKey: .difficulties)
    }
}
