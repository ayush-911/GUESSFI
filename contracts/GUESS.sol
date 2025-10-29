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
