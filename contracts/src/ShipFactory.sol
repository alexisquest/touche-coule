// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


import "./RandomShip.sol";
import "./Ship.sol";


contract ShipFactory {
  struct ShipType {
    string name;
  }
  event ShipDeploy(address a);

  ShipType[] listTypeShip;

  constructor() {
    listTypeShip.push(ShipType("DeterministicShip"));
    listTypeShip.push(ShipType("RandomShip"));
  }

  function getListTypeShip() external view returns (ShipType[] memory) {
    return listTypeShip;
  }

  function deployShip(string memory st) external {
    address a;
    if (keccak256(abi.encodePacked((st))) == keccak256(abi.encodePacked(("DeterministicShip")))) a = address(new DeterministicShip());
    if (keccak256(abi.encodePacked((st))) == keccak256(abi.encodePacked(("RandomShip")))) a = address(new RandomShip());
    else a = address(new DeterministicShip());
    emit ShipDeploy(a);
  }
}
