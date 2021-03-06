import MockoloFramework

let overload5 = """
/// \(String.mockAnnotation)
protocol Foo {

func collectionView(_ collectionView: UICollectionView, reuseIdentifierForItemAt index: Int) -> String?
func collectionView(_ collectionView: UICollectionView, configureCell cell: UICollectionViewCell, forItemAt index: Int)
func collectionView(_ collectionView: UICollectionView, sizeForItemAt index: Int) -> CGSize
func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt index: Int)
func collectionView(_ collectionView: UICollectionView, configure cell: UICollectionViewCell, forItemAt index: Int)
func loadImage(atURL url: URL) -> Observable<UIImage>
func loadImage(atURL url: URL, placeholder: UIImage) -> Observable<UIImage>
func loadImage(atURL url: URL, retryInterval: RxTimeInterval, maxRetries: Int) -> Observable<UIImage>
}
"""

let overloadMock5 =
"""
class FooMock: Foo {
    
    private var _doneInit = false

    init() {
        _doneInit = true
    }
    var collectionViewCallCount = 0
    var collectionViewHandler: ((UICollectionView, Int) -> (String?))?
    func collectionView(_ collectionView: UICollectionView, reuseIdentifierForItemAt index: Int) -> String? {
        collectionViewCallCount += 1
        if let collectionViewHandler = collectionViewHandler {
            return collectionViewHandler(collectionView, index)
        }
        return nil
    }
    var collectionViewConfigureCellCallCount = 0
    var collectionViewConfigureCellHandler: ((UICollectionView, UICollectionViewCell, Int) -> ())?
    func collectionView(_ collectionView: UICollectionView, configureCell cell: UICollectionViewCell, forItemAt index: Int)  {
        collectionViewConfigureCellCallCount += 1
        if let collectionViewConfigureCellHandler = collectionViewConfigureCellHandler {
            collectionViewConfigureCellHandler(collectionView, cell, index)
        }
        
    }
    var collectionViewSizeForItemAtCallCount = 0
    var collectionViewSizeForItemAtHandler: ((UICollectionView, Int) -> (CGSize))?
    func collectionView(_ collectionView: UICollectionView, sizeForItemAt index: Int) -> CGSize {
        collectionViewSizeForItemAtCallCount += 1
        if let collectionViewSizeForItemAtHandler = collectionViewSizeForItemAtHandler {
            return collectionViewSizeForItemAtHandler(collectionView, index)
        }
        return .zero
    }
    var collectionViewDidEndDisplayingCallCount = 0
    var collectionViewDidEndDisplayingHandler: ((UICollectionView, UICollectionViewCell, Int) -> ())?
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt index: Int)  {
        collectionViewDidEndDisplayingCallCount += 1
        if let collectionViewDidEndDisplayingHandler = collectionViewDidEndDisplayingHandler {
            collectionViewDidEndDisplayingHandler(collectionView, cell, index)
        }
        
    }
    var collectionViewConfigureCallCount = 0
    var collectionViewConfigureHandler: ((UICollectionView, UICollectionViewCell, Int) -> ())?
    func collectionView(_ collectionView: UICollectionView, configure cell: UICollectionViewCell, forItemAt index: Int)  {
        collectionViewConfigureCallCount += 1
        if let collectionViewConfigureHandler = collectionViewConfigureHandler {
            collectionViewConfigureHandler(collectionView, cell, index)
        }
        
    }
    var loadImageCallCount = 0
    var loadImageHandler: ((URL) -> (Observable<UIImage>))?
    func loadImage(atURL url: URL) -> Observable<UIImage> {
        loadImageCallCount += 1
        if let loadImageHandler = loadImageHandler {
            return loadImageHandler(url)
        }
        return Observable.empty()
    }
    var loadImageAtURLCallCount = 0
    var loadImageAtURLHandler: ((URL, UIImage) -> (Observable<UIImage>))?
    func loadImage(atURL url: URL, placeholder: UIImage) -> Observable<UIImage> {
        loadImageAtURLCallCount += 1
        if let loadImageAtURLHandler = loadImageAtURLHandler {
            return loadImageAtURLHandler(url, placeholder)
        }
        return Observable.empty()
    }
    var loadImageAtURLRetryIntervalCallCount = 0
    var loadImageAtURLRetryIntervalHandler: ((URL, RxTimeInterval, Int) -> (Observable<UIImage>))?
    func loadImage(atURL url: URL, retryInterval: RxTimeInterval, maxRetries: Int) -> Observable<UIImage> {
        loadImageAtURLRetryIntervalCallCount += 1
        if let loadImageAtURLRetryIntervalHandler = loadImageAtURLRetryIntervalHandler {
            return loadImageAtURLRetryIntervalHandler(url, retryInterval, maxRetries)
        }
        return Observable.empty()
    }
}

"""
