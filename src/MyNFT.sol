// SPDX-License-Identifier:MIT

pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    uint256 tokenId;

    constructor() ERC721("My NFT", "MNFT") Ownable(msg.sender) {}

    function mint(address _to, string calldata _uri) external onlyOwner {
        _mint(_to, tokenId);
        _setTokenURI(tokenId, _uri);
        tokenId += 1;
    }

    function mybalanceOf(address _owner) public view returns (uint256) {
        return balanceOf(_owner);
    }

    function myownerOf(uint256 _tokenId) external view returns (address) {
        return _ownerOf(_tokenId);
    }

    function mysafeTransferFrom(
        address _from,
        address _to,
        uint256 _tokenId,
        bytes memory data
    ) external payable {
        safeTransferFrom(_from, _to, _tokenId, data);
    }

    function mysafeTransferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    ) external payable {
        safeTransferFrom(_from, _to, _tokenId);
    }

    function mytransferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    ) external payable {
        transferFrom(_from, _to, _tokenId);
    }

    function myapprove(address _approved, uint256 _tokenId) external payable {
        approve(_approved, _tokenId);
    }

    function mysetApprovalForAll(address _operator, bool _approved) external {
        setApprovalForAll(_operator, _approved);
    }

    function mygetApproved(uint256 _tokenId) external view returns (address) {
        return getApproved(_tokenId);
    }

    function myisApprovedForAll(
        address _owner,
        address _operator
    ) external view returns (bool) {
        return isApprovedForAll(_owner, _operator);
    }
}

