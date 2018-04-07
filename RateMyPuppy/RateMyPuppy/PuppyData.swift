import UIKit

struct PuppyObject {
    let name: String
    let image: String
    let description: String
    var rating: Int
    var viewCount: Int
    var showFlashcard: Bool
    
    init(name: String, image: String, description: String, rating: Int = 0, viewCount: Int = 0, showFlashcard: Bool = true) {
        self.name = name
        self.image = image
        self.description = description
        self.rating = rating
        self.viewCount = viewCount
        self.showFlashcard = showFlashcard
    }
}

class PuppyData {
    var allPuppies = [PuppyObject]()
    var totalCount: Int { return allPuppies.count }
    var availableCount: Int {
        var count = 0
        for puppy in allPuppies {
            if puppy.showFlashcard == true {
                count += 1
            }
        }
        return count
    }
    
    
    init() {
        self.allPuppies = [puppy1, puppy2, puppy3, puppy4, puppy5, puppy6, puppy7, puppy8, puppy9, puppy10, puppy11, puppy12]
    }
    
    func puppy(at index: Int) -> PuppyObject {
        return allPuppies.element(at: index)!
    }
    
    func updateRating(of index: Int, to rating: Int){
        guard let puppyToRate = allPuppies.element(at: index) else {
            print("requested puppy not available for rating")
            return
        }

        let newPuppyObject = PuppyObject(
            name: puppyToRate.name,
            image: puppyToRate.image,
            description: puppyToRate.description,
            rating: rating,
            viewCount: puppyToRate.viewCount,
            showFlashcard: puppyToRate.showFlashcard)
        self.allPuppies.remove(at: index)
        self.allPuppies.insert(newPuppyObject, at: index)
    }
    
    func updateViewCount(of index: Int) {
        guard let puppyToUpdateCount = allPuppies.element(at: index) else {
            print("requested puppy not available for updating view count")
            return
        }
        
        let newPuppyObject = PuppyObject(
            name: puppyToUpdateCount.name,
            image: puppyToUpdateCount.image,
            description: puppyToUpdateCount.description,
            rating: puppyToUpdateCount.rating,
            viewCount: puppyToUpdateCount.viewCount + 1,
            showFlashcard: puppyToUpdateCount.showFlashcard)
        self.allPuppies.remove(at: index)
        self.allPuppies.insert(newPuppyObject, at: index)
    }
    
    func setShowFlashcardFalse(of index: Int) {
        guard let puppyToExclude = allPuppies.element(at: index) else {
            print("requested puppy not available to exclude from report")
            return
        }
        
        let newPuppyObject = PuppyObject(
            name: puppyToExclude.name,
            image: puppyToExclude.image,
            description: puppyToExclude.description,
            rating: puppyToExclude.rating,
            viewCount: puppyToExclude.viewCount,
            showFlashcard: false)
        self.allPuppies.remove(at: index)
        self.allPuppies.insert(newPuppyObject, at: index)
        self.availableCount
    }
    
    //MARK: - default data
    let puppy1 = PuppyObject(name: "Pupper", image: "puppy1.jpg", description: "Very basic. Your generic pupper.")
    let puppy2 = PuppyObject(name: "Fox-ish Corgi", image: "puppy2.jpg", description: "Cute in the kind of ugly way because is so stubby.")
    let puppy3 = PuppyObject(name: "Pensive Puppy", image: "puppy3.jpg", description: "A little fluff ball with a lot of thoughts")
    let puppy4 = PuppyObject(name: "Puppy 4", image: "puppy4.jpg", description: "Gets his eyebrows done by a professional.")
    let puppy5 = PuppyObject(name: "Lamb", image: "puppy5.jpg", description: "Not actually a puppy at all...")
    let puppy6 = PuppyObject(name: "Wide Eyed Doge", image: "puppy6.jpg", description: "Very curious and good at making you give him your left overs.")
    let puppy7 = PuppyObject(name: "Doge/Chihuahua Mix", image: "puppy7.jpg", description: "Loves long naps, barking at squirrels, eating your food. Hates STORMS.")
    let puppy8 = PuppyObject(name: "Puppy 4 again", image: "puppy8.jpg", description: "Can't fool me...")
    let puppy9 = PuppyObject(name: "Dachshund", image: "puppy9.jpg", description: "Sleeps all day...all night. Pretty much just a log that barks sometimes.")
    let puppy10 = PuppyObject(name: "Husky Buddies", image: "puppy10.jpg", description: "2 puppers are always better than 1")
    let puppy11 = PuppyObject(name: "Sleepy Scrappy", image: "puppy11.jpg", description: "His name says it all...")
    let puppy12 = PuppyObject(name: "Trash Panda", image: "puppy12.jpg", description: "Is not friends with Bradley Cooper.")
}


