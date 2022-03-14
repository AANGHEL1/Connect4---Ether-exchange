pragma solidity >=0.4.22 <0.7.0;
contract Connect4{
    uint256 [1042] public board;
    address public player1;
    address public player2;
    bool player1goesnext=false;
    uint8 public win1=0;
    uint8 public win2=0;
    

    event Player1Wins (bool win);
    event Player2Wins (bool win);
    event MoveMade (uint8 y, bool player);
    event IndexIS(uint256 i);
    
    constructor () public{
        player1=msg.sender;
        player1goesnext=true;
    }
    
    
    function joinGame () public {
       require(player2 == address(0));
       player2 = msg.sender;
    }
    

    function playGame (uint8 y) public{
        // dropping the disks
        uint256 x;
        if (player1goesnext)
        {

            require(msg.sender==player1);
            if(board[35+y]==0)
            {
                board[35+y]=1;
                x=35+y;
                emit IndexIS(x);
            }
            else if(board[28+y]==0)
            {
                board[28+y]=1;
                x=28+y;
                emit IndexIS(x);
            }
            else if (board[21+y]==0)
            {
                board[21+y]=1;
                x=21+y;
                emit IndexIS(x);
            }
            else if (board[14+y]==0)
            {
                board[14+y]=1;
                x=14+y;
                emit IndexIS(x);
            }
            else if(board[7+y]==0)
            {
                board[7+y]=1;
                x=y+7;
                emit IndexIS(x);
            }
            else
            {
                board[y]=1;
                x=y;
                emit IndexIS(x);
            }

    
            emit MoveMade(y,true);
            
                
        }
        else
        {
            require(msg.sender==player2);
            if(board[35+y]==0)
            {
                board[35+y]=2;
                x=35+y;
                emit IndexIS(x);
            }
            else if(board[28+y]==0)
            {
                board[28+y]=2;
                x=28+y;
                emit IndexIS(x);
            }
            else if (board[21+y]==0)
            {
                board[21+y]=2;
                x=21+y;
                emit IndexIS(x);
            }
            else if (board[14+y]==0)
            {
                board[14+y]=2;
                x=14+y;
                emit IndexIS(x);
            }
            else if(board[7+y]==0)
            {
                board[7+y]=2;
                x=y+7;
                emit IndexIS(x);
            }
            else
            {
                board[y]=2;
                x=y;
                emit IndexIS(x);
            }
                
            emit MoveMade(y,false);
            
        }
        player1goesnext=!player1goesnext;
        
        //PLAYER 1 AND 2 VERTICAL 
        uint256 i;
        for(i= 0;i<=20;i++)
        {
            if(board[i]==1)
            {
                if(board[i+7]==1)
                    if(board[i+14]==1)
                        if(board[i+21]==1)
                        {
                            win1=1;
                            emit Player1Wins(true);
                        }
            }
            if(board[i]==2)
            {
                if(board[i+7]==2)
                    if(board[i+14]==2)
                        if(board[i+21]==2)
                        {
                            win1=2;
                            emit Player2Wins(true);
                        }
            }
        }
        
        //PLAYER 1 AND 2 HORIZONTAL
        for(i=3;i<=6;i++)
        {
            if(board[i]==1)
                if(board[i-1]==1)
                    if(board[i-2]==1)
                        if(board[i-3]==1)
                        {
                            win1=2;
                            emit Player1Wins(true);
                        }
            if(board[i]==2)
                if(board[i-1]==2)
                    if(board[i-2]==2)
                        if(board[i-3]==2)
                        {
                            win2=2;
                            emit Player2Wins(true);
                        }
        }
        for(i=10;i<=13;i++)
        {
            if(board[i]==1)
                if(board[i-1]==1)
                    if(board[i-2]==1)
                        if(board[i-3]==1)
                        {
                            win1=2;
                            emit Player1Wins(true);
                        }
            if(board[i]==2)
                if(board[i-1]==2)
                    if(board[i-2]==2)
                        if(board[i-3]==2)
                        {
                            win2=2;
                            emit Player2Wins(true);
                        }
        }
        for(i=17;i<=20;i++)
        {
            if(board[i]==1)
                if(board[i-1]==1)
                    if(board[i-2]==1)
                        if(board[i-3]==1)
                        {
                            win1=2;
                            emit Player1Wins(true);
                        }
                            
            if(board[i]==2)
                if(board[i-1]==2)
                    if(board[i-2]==2)
                        if(board[i-3]==2)
                        {
                            win2=2;
                            emit Player2Wins(true);
                        }
        }
        for(i=24;i<=27;i++)
        {
            if(board[i]==1)
                if(board[i-1]==1)
                    if(board[i-2]==1)
                        if(board[i-3]==1)
                        {
                            win1=2;
                            emit Player1Wins(true);
                        }
                            
            if(board[i]==2)
                if(board[i-1]==2)
                    if(board[i-2]==2)
                        if(board[i-3]==2)
                        {
                            win2=2;
                            emit Player2Wins(true);
                        }
        }
        for(i=31;i<=34;i++)
        {
            if(board[i]==1)
                if(board[i-1]==1)
                    if(board[i-2]==1)
                        if(board[i-3]==1)
                        {
                            win1=2;
                            emit Player1Wins(true);
                        }
            if(board[i]==2)
                if(board[i-1]==2)
                    if(board[i-2]==2)
                        if(board[i-3]==2)
                        {
                            win2=2;
                            emit Player2Wins(true);
                        }
        }
        
        for(i=38;i<=41;i++)
        {
            if(board[i]==1)
                if(board[i-1]==1)
                    if(board[i-2]==1)
                        if(board[i-3]==1)
                        {
                            win1=2;
                            emit Player1Wins(true);
                        }
            if(board[i]==2)
                if(board[i-1]==2)
                    if(board[i-2]==2)
                        if(board[i-3]==2)
                        {
                            win2=2;
                            emit Player2Wins(true);
                        }
        }
        
        
        
        
        /*if(board[35]==1)
                if(board[36]==1)
                    if(board[37]==1)
                        if(board[38]==1)
                        {
                            win1=2;
                            emit Player1Wins(true);
                        }
        if(board[36]==1)
                if(board[37]==1)
                    if(board[38]==1)
                        if(board[39]==1)
                        {
                            win1=2;
                            emit Player1Wins(true);
                        }
        if(board[37]==1)
                if(board[38]==1)
                    if(board[39]==1)
                        if(board[40]==1)
                        {
                            win1=2;
                            emit Player1Wins(true);
                        }
        if(board[38]==1)
                if(board[39]==1)
                    if(board[40]==1)
                        if(board[41]==1)
                        {
                            win1=2;
                            emit Player1Wins(true);
                        }
            
        //if(player1goesnext==false){   
        if(board[35]==2)
            if(board[36]==2)
                if(board[37]==2)
                    if(board[38]==2)
                    {
                        win2=2;
                        emit Player2Wins(true);
                    }
        if(board[36]==2)
                if(board[37]==2)
                    if(board[38]==2)
                        if(board[39]==2)
                        {
                            win2=2;
                            emit Player2Wins(true);
                        }
        if(board[37]==2)
                if(board[38]==2)
                    if(board[39]==2)
                        if(board[40]==2)
                        {
                            win2=2;
                            emit Player2Wins(true);
                        }
        if(board[38]==2)
                if(board[39]==2)
                    if(board[40]==2)
                        if(board[41]==2)
                        {
                            win2=2;
                            emit Player2Wins(true);
                        }*/
        //}
            /*if(board[i]==2)
                if(board[i+1]==2)
                    if(board[i+2]==2)
                        if(board[i+3]==2)
                        {
                            win2=2;
                            emit Player2Wins(true);
                        }*/
        
        /*for(i=0;i<42;i++)
        {
            require(i%7<=3);
            if(board[i]==1)
                if(board[i-1]==1)
                    if(board[i-2]==1)
                        if(board[i-3]==1)
                        {
                            win1=2;
                            emit Player1Wins(true);
                        }
            if(board[i]==2)
                if(board[i-1]==2)
                    if(board[i-2]==2)
                        if(board[i-3]==2)
                        {
                            win2=2;
                            emit Player2Wins(true);
                        }
        }*/
       
        
        
        //PLAYER 1 AND 2 DIAGONAL to RIGHT
        for(i=0; i<=17; i++)
        {
            if(board[i]==1)
                if(board[i+7+1]==1)
                    if(board[i+14+2]==1)
                        if(board[i+21+3]==1)
                        {
                            win1=3;
                            emit Player1Wins(true);
                        }
            if(board[i]==2)
                if(board[i+7+1]==2)
                    if(board[i+14+2]==2)
                        if(board[i+21+3]==2)
                        {
                            win2=3;
                            emit Player2Wins(true);
                        }
        }
        
        //PLAYER 1 AND 2 DIAGONAL to LEFT
        
        for(i=0; i<=20; i++)
        {
            if(board[i]==1)
                if(board[i+7-1]==1)
                    if(board[i+14-2]==1)
                        if(board[i+21-3]==1)
                        {
                            win1=4;
                            emit Player1Wins(true);
                        }
            if(board[i]==2)
                if(board[i+7-1]==2)
                    if(board[i+14-2]==2)
                        if(board[i+21-3]==2)
                        {
                            win2=4;
                            emit Player2Wins(true);
                        }
        }
        
       
    }
}
