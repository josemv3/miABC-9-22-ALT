//
//  ViewController.swift
//  miABC 9-22 ALT
//
//  Created by Joey Rubin on 8/29/22.
//

import UIKit

//private let reusableIdentifier = "cell"

private var letterSections = [
    ["A", "B", "C", "D", "E", "F", "G", "H", "I"],
    ["J", "K", "L", "M", "N", "O", "P", "Q", "R"],
    ["S", "T", "U", "V", "W", "X", "Y", "Z"]
]

class ViewController: UIViewController, UICollectionViewDelegate {
    
    enum Section {
        case main
    }
    
    var numbers: [Int] = [0, 1, 2]
    var letters: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"]
    
//    var letterDict: [Int: String] =
//    [0: "A", "B", "C", "D", "E", "F", "G", "H"],
//    [1: "J", "K", "L", "M", "N", "O", "P", "Q", "R"],
//    [3: "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, String>!//SOURCE1
    //var dataSource: UICollectionViewDiffableDataSource<Int, String>!//SOURCE1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = configureLayout()
        configureDataSource()
        navigationItem.title = "miaABC"
    }
    
    func configureLayout() -> UICollectionViewCompositionalLayout {
        let spacing: CGFloat = 5
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func configureDataSource() {//SOURCE2
        dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reusidentifier, for: indexPath) as? CollectionViewCell else {
                fatalError("Cannot create new cell")
            }
            
            cell.cellLabel.text = item.description
            
            return cell
        }
        
        var initialSnapshot = NSDiffableDataSourceSnapshot<Section, String>()//SOURCE3
        //var initialSnapshot = NSDiffableDataSourceSnapshot<Int, String>()//SOURCE3
        
        initialSnapshot.appendSections([.main])
        initialSnapshot.appendItems(letters)
        
        dataSource.apply(initialSnapshot, animatingDifferences: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        print(item)
        mainLabel.text = item
        
    }
}

