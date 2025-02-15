import UIKit

final class StoriesService {
    
    static let shared = StoriesService()
    
    private init() {}
    
    private let stories: [Story] = [
        Story(image: UIImage(named: StoriesImageName.story0)!),
        Story(image: UIImage(named: StoriesImageName.story1)!),
        Story(image: UIImage(named: StoriesImageName.story2)!),
        Story(image: UIImage(named: StoriesImageName.story3)!),
        Story(image: UIImage(named: StoriesImageName.story0)!),
        Story(image: UIImage(named: StoriesImageName.story1)!),
        Story(image: UIImage(named: StoriesImageName.story2)!),
        Story(image: UIImage(named: StoriesImageName.story3)!),
        Story(image: UIImage(named: StoriesImageName.story0)!),
        Story(image: UIImage(named: StoriesImageName.story1)!),
        Story(image: UIImage(named: StoriesImageName.story2)!),
        Story(image: UIImage(named: StoriesImageName.story3)!)
    ]
    
    func fetchStories() -> [Story] {
        return stories
    }
}
