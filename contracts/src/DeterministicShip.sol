// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import './Ship.sol';

struct Coordinates {
    uint x;
    uint y;
}

contract DeterministicShip is Ship{
    Coordinates private c;
    uint private id;
    Coordinates private target;

    constructor() {
        target.x = 0;
        target.y = 0;
    }

    function update(uint _x, uint _y) public virtual override{
        c.x = _x;
        c.y = _y;
    }

    
    function fire() public virtual override returns (uint, uint){
        uint x = target.x;
        uint y = target.y;
        do{
            if(target.y==50){
                if(target.x == 50){
                    target.x = 0;

                }
                else{
                    target.x++;
                }
                
                target.y = 0;
            }
            else{
                target.y++;
            }

        }while(target.x==c.x && target.y==c.y);
        return (x,y);
    }

    function place(uint width, uint height) public virtual override returns (uint, uint){
        uint x = uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,msg.sender,"x"))) % width;
        uint y = uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,msg.sender,"y"))) % height;
        return (x,y);
    }

    function move(uint width, uint height) public virtual override returns (uint, uint){
        uint x = c.x;
        uint y = c.y;
        uint ranXorY = uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,msg.sender,"x"))) % 2;
        uint ranDirection = uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,msg.sender,"y"))) % 2;
        if(ranXorY == 0){
            if(ranDirection == 0){
                x = x-1;
            }
            else{
                x = x+1;
            }
        }
        else{
            if(ranDirection == 0){
                y = y-1;
            }
            else{
                y = y+1;
            }
        }
        if(x<=width && y<=height){
            update(x,y);
        }
        return(c.x,c.y);
               
    }

}