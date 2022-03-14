/////Ana Maria Anghel//////


function getInstance () {
  let contractAddress = document.querySelector ("#contractAddress").value;
  if (contractAddress === "") {
    console.error ("no contract address set");
  }
  let factory = web3.eth.contract (window.abi);
  let instance = factory.at (contractAddress);
  return instance;
}


function init () {
    //playing
  for (let i = 0; i < 7; i++) {
      let button = document.querySelector (`#button${i}`);
      button.addEventListener ("click", helper (i));
  }

  // join
  document.querySelector ("#joinGame").addEventListener ("click", joinGame);
    
    
  // the contract.
  fetch ("./connect4.abi.json")
    .then (function (response) {
      return response.json ();
    })
    .then (function (abi) {
      window.abi = abi;
    });

}

function helper (i) {
  return function (evt) {
    //listening for Move events.
    startListening ();
      
    let instance = getInstance ();
    let sender = web3.eth.accounts[0];
    console.log (`calling play with y = ${i} from ${sender}`);
  
    //calling playGame from Smart Contract
    instance.playGame (i, { from : sender, gas : 2000000 },
    function (error, result) { 
        if (!error) {
          console.log(result.toString ());
        } else {
          console.error (error); 
        }
      }
    );

  }
}
function joinGame (evt) {
  let instance = getInstance ();
  let sender = web3.eth.accounts[0];
  console.log ("calling joinGame");
    
  //calling joingame from Smart Contract
  instance.joinGame (
    { from : sender, gas : 200000 },
    function (error, result) { 
      if (!error) {
        console.log (result.toString ());
      } else {
        console.error (error); 
      }
    }
  );     
}

let alreadyListening = false;

function startListening () {
  if (!alreadyListening) {
    let instance = getInstance ();
    let event = instance.MoveMade (function (error, result) {
      if (!error) {
        //announting move
        console.log ("A Move event was received ");
        //calling function WhoWon() to check if any player won the game
        WhoWon();
        // Updating screen durin the game
        updateScreen ();
      }
        else
    {
        console.error("Error here");
    }
    });
    alreadyListening = true;
  }
}

function updateScreen () {
    let instance = getInstance ();
    let sender = web3.eth.accounts[0];
    // calling event in Smart Contract that returns the index of board that is supposed to be colored
    let ev = instance.IndexIS(function(error,result){
                if (!error) {
                    // declaring variable cell to be teh cell that needs to change color
                    let cell = document.querySelector(`#cell${result.args.i.c[0]}`);
                       instance.board (
                       result.args.i.c[0],
                       { from : sender, gas : 200000 },
                       function (error, result) {
                         if (!error) {
                                       //changing colors of cells active
                                       if(result.c[0]==0)
                                        cell.style.fill='white';
                                       else if(result.c[0]==1)
                                       // player 1 gets blue
                                        cell.style.fill='#1666C6';
                                       else
                                       // player 2 gets orange
                                        cell.style.fill='#FFC300';

                         } else {
                           console.log ("error here");
                         }
                       }
                    );
                   }
                     else
                 {
                     console.log("Error here");
             }});
  }



function WhoWon(){
    let instance=getInstance();
    let event1 = instance.Player1Wins (function (error, result) {
      if (!error) {
        // event to anounce if player 1 wins
        console.log ("Player 1 Wins the Game");
        window.alert("Player 1 Wins! Refresh page to restart game.");
      }
    else
    {
    console.error("Error here");
    }
    });
    
    let event2 = instance.Player2Wins (function (error, result) {
      if (!error) {
          // event to announce if player 2 wins
          console.log ("Player 2 Wins the Game");
          window.alert("Player 2 Wins! Refresh page to restart game.");
        }
      else
      {
      console.error("Error here");
      }
      });
}

