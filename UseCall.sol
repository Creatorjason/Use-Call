//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Called{
    string public name;
    uint public age;
    receive() external payable{}

    function change(string calldata _name, uint _age) external payable returns(string memory ans){
        name = _name;
        age = _age;
        ans = "Am called";
    }
}


contract Calling{
    bytes public data;
    uint public value;

    function callChange(address _contract, string calldata _name, uint _age) external payable returns(bool confirm, bytes memory _data){
       (confirm, _data) = _contract.call{value:msg.value}(abi.encodeWithSignature("change(string,uint256)", _name, _age));
       require(confirm, "Unprocessed");
       data = _data;
       value = msg.value;
    }
}
