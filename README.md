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

🔗 https://repo.sourcify.dev/11142220/0x0849B1C5D701cFb1a055EeEa051b27DfD7429b2A/


---

🧠 Usage Instructions

1. Clone or open the contract in Remix IDE.


2. Deploy the contract using any Ethereum test network.


3. Call functions to:

Start the game

Submit your guesses

Reveal the secret number




---
🚀 THE CODE I HAVE USED:
---


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
----

THERE ARE ALSO SOME IMPORTANT SCREENSHOTS ATTACHED HERE :
----


<img width="1366" height="768" alt="Screenshot (1)" src="https://github.com/user-attachments/assets/e736ce05-5e44-463c-83fa-3595db982a06" />

<img width="1366" height="768" alt="Screenshot (2)" src="https://github.com/user-attachments/assets/34a918b7-c19c-4601-a4f2-80ea3bba239a" />

<img width="1366" height="768" alt="Screenshot (3)" src="https://github.com/user-attachments/assets/ccc9b442-9b71-4085-88fa-03d63ebdb7d4" />

<img width="1366" height="768" alt="Screenshot (4)" src="https://github.com/user-attachments/assets/4a2926c1-b1e1-471a-9505-a2fb9f66f9f8" />
----
THATS THE END OF MY PROJECT.THANKS A LOT FOR GOING THROUGH IT . WISH YOU THE BEST.
----
