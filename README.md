1) PROJECT NAME : GUESSFI 
2) PROJECT PUT GUESSES,smart contract reveals correct numnumbe
3) easy to use
 4) Smart code contract link : https://repo.sourcify.dev/11142220/0x0849B1C5D701cFb1a055EeEa051b27DfD7429b2A/
 5) use this code :
    // SPDX-LICENSE-IDENTIFIER:MIT
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

    function startGame(uint256 _secretNumber) external onlyOwner {
        require(!gameActive, "Game already running");
        secretNumber = _secretNumber;
        gameActive = true;
        emit GameStarted(block.timestamp);
    }

    function makeGuess(uint256 _guess) external {
        require(gameActive, "No active game");
        require(!hasGuessed[msg.sender], "You already guessed");
        require(_guess > 0 && _guess <= 100, "Guess between 1 and 100");

        guesses[msg.sender] = _guess;
        hasGuessed[msg.sender] = true;

        emit GuessSubmitted(msg.sender, _guess);
    }

    function revealAndEndGame() external onlyOwner {
        require(gameActive, "Game not active");
        gameActive = false;

        emit GameEnded(secretNumber);

        for (uint i = 0; i < players.length; i++) {
            address player = players[i];
            if (guesses[player] == secretNumber) {
                emit Winner(player, secretNumber);
            }
        }
    }

    address[] private players;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }
}
# GUESSFI<img width="1366" height="768" alt="Screenshot (1)" src="https://github.com/user-attachments/assets/149cfee4-1dfb-4fdb-9547-21e1c6e7a788" />
