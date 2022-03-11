//
//  RecipesView.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 02.03.2022.
//

import UIKit

class RecipesView: UIView {

    let collectionView: UICollectionView!
    let plusButton = PlusButton()
    init() {
        collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: RecipesView.createLayout())
        super.init(frame: CGRect())
        backgroundColor = .white
        collectionView.backgroundColor = .clear
        collectionView.register(RecipesCell.self, forCellWithReuseIdentifier: RecipesCell.reuseID)
        addSubview(collectionView)
        addSubview(plusButton)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90),
            collectionView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            plusButton.widthAnchor.constraint(equalToConstant: 64),
            plusButton.heightAnchor.constraint(equalToConstant: 64),
            plusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            plusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90)])
    }
    
    static func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { _, _ in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.48),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalWidth(0.6))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitem: item,
                                                           count: 2)
            group.interItemSpacing = .fixed(12)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 12
            section.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 12, bottom: 12, trailing: 12)
            return section
        }
        return layout
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
