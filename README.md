# Connect4---Ether-exchange
This is a game of Connect4 that can be played multiplayer. In order to move, you need to sell ethers to the game. The game uses Rinkeby Test Network


This is the classic Connect 4 game. To win, a player must make a connections between 4 of the same colored dots either on the vertical, horizontal or diagonal.

Also, you need the first one to connect the dots, so try to make the second player's job harder.

INSTRUCTIONS:

1.Introduce the smart contract address in the label.
2. Press any of the green buttons above the board to drop the disks on that row. 
3. They will drop as low as possible.
4. try to connect the disks and avoid letting the other player win.
5. The second player should join the game by clicking the "join game" button and start playing as player1

ROLE OF SMART CONTRACT:

Being a multiplayer game, the smart contract facilitates the good working of the game imposing the players to some rules defined in the contract. Also, it makes the game safe by introducing the contract address at the beginning of the game. Joining the contract by playing the game means agreeing to some rules imposed by the contract such as players' turns or where the disk drops. The rules are imposed through require statements such as "reguire(msg.sender==player1);".
