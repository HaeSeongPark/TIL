 import UIKit

 class Main: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Collection View
    // Collection View-Ed
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 1 {
            return CGSize(width: view.frame.width, height: 140)
        }
        return CGSize(width: view.frame.width, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 1 {
            let CellB = collectionView.dequeueReusableCell(withReuseIdentifier: "CellB", for: indexPath)
            return CellB
        }
        
        let CellA = collectionView.dequeueReusableCell(withReuseIdentifier: "CellA", for: indexPath)
        
        return CellA
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

