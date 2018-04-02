import Foundation

class RateMyPuppyModel {
    private var puppyData = PuppyData()
    private var currentPuppyIndex: Int = 1
    private var favoriteIndex: Int?
    
    var currentPuppy: PuppyObject {
            return puppyData.puppy(at: currentPuppyIndex)
    }
    
    var indexOfCurrentPuppy: Int {
        return currentPuppyIndex
    }
    
    var nextPuppy: PuppyObject {
            currentPuppyIndex += 1
            
            if currentPuppyIndex >= self.puppyData.count {
                currentPuppyIndex = 0
            }
            
            return currentPuppy
    }
    
    var favoritePuppy: PuppyObject? {
            guard let favorite = favoriteIndex else {
                print("We don't have a favorite puppy. 🐶")
                return nil
            }
            return puppyData.puppy(at: favorite)
    }
    
    func rateCurrentPuppy(as rating: Int) {
        puppyData.updateRating(of: currentPuppyIndex, to: rating)
        if let favorite = favoriteIndex, currentPuppy.rating > favorite {
            favoriteIndex = currentPuppyIndex
        } else {
            favoriteIndex = currentPuppyIndex
        }
    }
    
    func incrementViewCount() {
        puppyData.updateViewCount(of: currentPuppyIndex)
    }
    
    func toggleShowInReport() {
        puppyData.setShowInReportFalse(of: currentPuppyIndex)
    }
}

protocol PuppyDataDelegate: class {
    func getCurrentPuppy() -> PuppyObject
    func getFavoritePuppy() -> PuppyObject?
}
