struct LikeStore: Codable {
    let classification: String
    let isNew: Bool
    let isQuickBooking: Bool
    let isRemoteWaiting: Bool
    let rating: Double
    let restaurantIdx: Int
    let restaurantName: String
    let reviewCount: Int
    let summaryAddress: String
    let thumbnail: String
    let useBooking: Bool
    let useWaiting: Bool
    let waitingCount: Int
}

struct LikeStoreList: Codable {
    let list: [LikeStore]
}
