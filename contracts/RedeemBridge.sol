// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/PullPayment.sol";
import "@openzeppelin/contracts/token/ERC1155/presets/ERC1155PresetMinterPauser.sol";

contract RedeemBridge is ERC1155PresetMinterPauser {

    using Counters for Counters.Counter;
    Counters.Counter public _tokenIds;
    mapping(uint256 => string) public _tokenURIs;
    mapping(uint256 => uint) public _tokenState; // 0: unminted, 1: minted, 2: used
    uint MAX_SUPPLY = 5;

    constructor(string memory _uri) ERC1155PresetMinterPauser(_uri){
        _setRoleAdmin(MINTER_ROLE, DEFAULT_ADMIN_ROLE);
    }

    function grantMinterRole(address buyer) public onlyOwner {
        grantRole(MINTER_ROLE, buyer);
    }

    modifier onlyOwner() {
        require(hasRole(DEFAULT_ADMIN_ROLE, msg.sender), "Restricted to owner.");
        _;
    }

    function _setTokenURI(uint tokenId) internal {
        _tokenURIs[tokenId] = uri(tokenId);
    }

    function _setTokenState(uint tokenId, uint state) internal {
        _tokenState[tokenId] = state;
    }

    function mintNFT() public returns (uint){
        
        uint newItemId = _tokenIds.current();
        require(newItemId < MAX_SUPPLY, "exceed max supply");

        mint(msg.sender, newItemId, 1, "");
        _setTokenURI(newItemId);
        _setTokenState(newItemId, 1);
        _tokenIds.increment();

        return newItemId;
    }

    function useNFT(uint _tokenID) public{
        // TODO: get available token ID
        _setTokenState(_tokenID, 2);
        safeTransferFrom(msg.sender, address(this), _tokenID, 1, "");
    }

    function onERC1155Received(address operator, address from, uint256 id, uint256 value, bytes calldata data) external returns (bytes4){
        return bytes4(keccak256("onERC1155Received(address,address,uint256,uint256,bytes)"));
    }
}

