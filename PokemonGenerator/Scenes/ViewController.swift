//
//  ViewController.swift
//  PokemonGenerator
//
//  Created by stefan.adisurya on 19/05/22.
//

import UIKit

internal final class ViewController: UIViewController {

    // MARK: - UI Elements
    @IBOutlet weak var pokemonTextLabel: UILabel!
    @IBOutlet weak var generateButton: UIButton!
    
    // MARK: - Data
    private var data: [ResultResponse] = []
    private var selectedPokemon: String = ""
    
    // MARK: - Methods
    internal override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
    
    private func setupUI() {
        pokemonTextLabel.text = "No Pokemon ❌"
        generateButton.layer.cornerRadius = 10
    }
    
    @IBAction func generateButtonTapped(_ sender: Any) {
        guard let randomizedElement = data.randomElement() else { return }
        self.selectedPokemon = randomizedElement.name
        pokemonTextLabel.text = "You have chosen \(selectedPokemon.capitalized)!"
    }
    
    private func fetchData() {
        APIService.shared.GET(target: .getPokemon) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                
            case .success(let response):
                do {
                    let json = try JSONDecoder().decode(PokemonResponse.self, from: response.data)
                    self.data.append(contentsOf: json.results)
                } catch {
                    print("Gagal mendapatkan data!")
                }
            }
        }
    }

}
