![GUESSFI Banner](https://share.google/PpybfjC7CHpbysWZE)

🎮 GUESSFI

🔢 A Fun Smart Contract Guessing Game


---

🧩 Project Overview

GUESSFI is a blockchain-based guessing game built with Solidity.
Players submit their guesses, and the smart contract reveals the correct number once the game ends.


---

🚀 Features

✅ Easy to use
✅ Fair and transparent results
✅ Automatically reveals the correct number


---

💻 Smart Contract Link

🔗 View Contract on Sourcify


---

🧠 Usage Instructions

1. Clone or open the contract in Remix IDE.


2. Deploy the contract using any Ethereum test network.


3. Call functions to:

Start the game

Submit your guesses

Reveal the secret number





---

🧱 Smart Contract Code:https://repo.sourcify.dev/11142220/0x0849B1C5D701cFb1a055EeEa051b27DfD7429b2A/



USE THIS CODE :

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GuessFi {
    address public owner;
    uint256 private secretNumber;
    bool public gameActive;

    mapping(address => bool) public hasGuessed;
    mapping(address => uint256) public guesses;

    event GameStarted(uint256 timestamp);
    event GuessSubmitted(address indexed player, uint256 guess);
    event GameEnded(uint256 correctNumber);
    event Winner(address indexed player, uint256 guessedNumber);

    constructor() {
        owner = msg.sender;
    }

    // Owner starts a new game with a secret number
    function startGame(uint256 _secretNumber) external onlyOwner {
        require(!gameActive, "Game already running");
        secretNumber = _secretNumber;
        gameActive = true;
        emit GameStarted(block.timestamp);
    }

    // Players submit their guess (no duplicates)
    function makeGuess(uint256 _guess) external {
        require(gameActive, "No active game");
        require(!hasGuessed[msg.sender], "You already guessed");
        require(_guess > 0 && _guess <= 100, "Guess between 1 and 100");

        guesses[msg.sender] = _guess;
        hasGuessed[msg.sender] = true;

        emit GuessSubmitted(msg.sender, _guess);
    }

    // Owner reveals and ends game
    function revealAndEndGame() external onlyOwner {
        require(gameActive, "Game not active");
        gameActive = false;

        emit GameEnded(secretNumber);

        // Announce winners
        for (uint i = 0; i < players.length; i++) {
            address player = players[i];
            if (guesses[player] == secretNumber) {
                emit Winner(player, secretNumber);
            }
        }
    }

    // List of all players (for winner selection)
    address[] private players;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }
}
---

🏆 How It Works

1. The owner starts the game and sets a secret number.


2. Players submit guesses using their Ethereum addresses.


3. When the game ends, the contract reveals the correct number and announces the winner.




---

📜 License

🪪 **MIT License
