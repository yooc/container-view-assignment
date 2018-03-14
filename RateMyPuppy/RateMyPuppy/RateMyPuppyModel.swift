import Foundation

class RateMyPuppyModel {
    var puppyData = PuppyData()
    var currentPuppyIndex: Int = 1
    var favoriteIndex: Int?
    
    var currentPuppy: PuppyObject {
        get {
            return puppyData.puppy(at: currentPuppyIndex)
        }
    }
    
}

protocol PuppyDataDelegate: class {
    func getCurrentPuppy() -> PuppyObject
}
