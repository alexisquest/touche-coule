// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


import "./MyShip2.sol";
import "./Ship.sol";


contract ShipFactory {
  struct ShipType {
    string name;
  }
  event ShipDeploy(address a);

  ShipType[] listTypeShip;

  constructor() {
    listTypeShip.push(ShipType("a"));
    listTypeShip.push(ShipType("b"));
  }

  function getListTypeShip() external view returns (ShipType[] memory) {
    return listTypeShip;
  }

  function deployShip(string memory st) external {
    address a;
    if (keccak256(abi.encodePacked((st))) == keccak256(abi.encodePacked(("a")))) a = address(new MyShip());
    else a = address(new MyShip2());
    emit ShipDeploy(a);
  }
}
