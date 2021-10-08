// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract ImanoToken is ERC721 { 
    using Counters for Counters.Counter; 
    Counters.Counter private _tokenIds; 
    address Owner;
    address Creatorx = 0xf7d7375edF7A76cB4f3dB60c3D65A79640B1cfEb;
 
    constructor ()  ERC721("ImanoToken", "Imano") {
        Owner = msg.sender;
    } 

 
    struct Item { 
        uint256 id; 
        address creator; 
        string uri; 
    } 
 
    mapping (uint256 => Item) public Items; 

    function TakeCreateItem(string memory uri) external payable returns(uint256){
        payable(Owner).transfer(0.01 ether);
       return _createItem(uri);
    }
 
    function _createItem(string memory _uri) private returns (uint256){ 
        _tokenIds.increment(); 
        uint256 newItemId = _tokenIds.current(); 
        _safeMint(msg.sender, newItemId); 
 
        Items[newItemId] = Item(newItemId, msg.sender, _uri); 
 
        return newItemId; 
    } 
 
    function tokenURI(uint256 tokenId) public view override returns (string memory) { 
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token"); 
 
       return Items[tokenId].uri; 
    } 
}