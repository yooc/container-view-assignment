import Foundation

class RateMyPuppyModel {
    private var puppyData = PuppyData()
    private var currentPuppyIndex: Int = 1
    private var favoriteIndex: Int?
    
    var currentPuppy: PuppyObject {
        get {
            return puppyData.puppy(at: currentPuppyIndex)
        }
    }
    
    var nextPuppy: PuppyObject {
        get {
            currentPuppyIndex += 1
            
            if currentPuppyIndex >= self.puppyData.count {
                currentPuppyIndex = 0
            }
            
            return currentPuppy
        }
    }
    
    func rateCurrentPuppy(as rating: Int) {
        print("rating of puppy: \(currentPuppy.rating)")
        puppyData.updateRating(of: currentPuppyIndex, to: rating)
        print("rating of puppy updated to: \(currentPuppy.rating)")
    }
}

protocol PuppyDataDelegate: class {
    func getCurrentPuppy() -> PuppyObject
}
