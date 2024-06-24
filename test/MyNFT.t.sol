// SPDX-License-Identifier:MIT

pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../src/MyNFT.sol";

contract MyNFTTest is Test {
    MyNFT nft;
    address owner = address(1);
    address user = address(2);

    function setUp() public {
        nft = new MyNFT();
        nft.transferOwnership(owner);
    }

    function testMint() public {
        // Only owner can mint
        vm.prank(owner);
        nft.mint(user, "ipfs://example");

        assertEq(nft.balanceOf(user), 1);
        assertEq(nft.tokenURI(0), "ipfs://example");
    }

    function testMyBalanceOf() public {
        // Check balance
        vm.prank(owner);
        nft.mint(user, "ipfs://example");

        assertEq(nft.mybalanceOf(user), 1);
    }

    function testMyOwnerOf() public {
        // Check owner of token
        vm.prank(owner);
        nft.mint(user, "ipfs://example");

        assertEq(nft.myownerOf(0), user);
    }

    function testMySafeTransferFrom() public {
        // Safe transfer
        vm.prank(owner);
        nft.mint(user, "ipfs://example");

        vm.prank(user);
        nft.mysafeTransferFrom(user, owner, 0);

        assertEq(nft.balanceOf(owner), 1);
    }

    function testMyTransferFrom() public {
        // Transfer
        vm.prank(owner);
        nft.mint(user, "ipfs://example");

        vm.prank(user);
        nft.mytransferFrom(user, owner, 0);

        assertEq(nft.balanceOf(owner), 1);
    }

    function testMyApprove() public {
        // Approve
        vm.prank(owner);
        nft.mint(user, "ipfs://example");

        vm.prank(user);
        nft.myapprove(owner, 0);

        assertEq(nft.mygetApproved(0), owner);
    }

    function testMySetApprovalForAll() public {
        // Set approval for all
        vm.prank(owner);
        nft.mint(user, "ipfs://example");

        vm.prank(user);
        nft.mysetApprovalForAll(owner, true);

        assertTrue(nft.myisApprovedForAll(user, owner));
    }
}
