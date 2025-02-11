#assest tranfer 


// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;
contract AssetTransfer {
 struct Asset {
 uint256 id;
 string name;
 address owner;
 }
 uint256 private nextAssetId;
 mapping(uint256 => Asset) public assets;
 event AssetCreated(uint256 id, string name, address owner);
 event AssetTransferred(uint256 id, address from, address to);
 // Create a new asset
 function createAsset(string memory _name) public {
 uint256 assetId = nextAssetId;
 assets[assetId] = Asset(assetId, _name, msg.sender);
 emit AssetCreated(assetId, _name, msg.sender);
 nextAssetId++;
 }
 // Transfer an asset to a new owner
 function transferAsset(uint256 _assetId, address _newOwner) public {
 require(assets[_assetId].owner == msg.sender, "You are not the owner");
 address previousOwner = assets[_assetId].owner;
 assets[_assetId].owner = _newOwner;
 emit AssetTransferred(_assetId, previousOwner, _newOwner);
 }
 // Get details of an asset
 function getAsset(uint256 _assetId) public view returns (uint256, string memory, address) {
 Asset memory asset = assets[_assetId];
 return (asset.id, asset.name, asset.owner);
 }}
