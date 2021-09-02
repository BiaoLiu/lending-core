// SPDX-License-Identifier: agpl-3.0
pragma solidity 0.8.6;

/**
 * @title PoolAddressesProvider contract
 * @dev Main registry of addresses part of or connected to the protocol, including permissioned roles
 * - Acting also as factory of proxies and admin of those, so with right to change its implementations
 * - Owned by the Aave Governance
 * @author Aave
 **/
interface IPoolAddressesProvider {
  event MarketIdSet(string newMarketId);
  event PoolUpdated(address indexed newAddress);
  event ConfigurationAdminUpdated(address indexed newAddress);
  event EmergencyAdminUpdated(address indexed newAddress);
  event PoolConfiguratorUpdated(address indexed newAddress);
  event PriceOracleUpdated(address indexed newAddress);
  event RateOracleUpdated(address indexed newAddress);
  event ProxyCreated(bytes32 id, address indexed newAddress);
  event BridgeAccessControlUpdated(address indexed newAddress);
  event AddressSet(bytes32 id, address indexed newAddress, bool hasProxy);

  function getMarketId() external view returns (string memory);

  function setMarketId(string calldata marketId) external;

  function setAddress(bytes32 id, address newAddress) external;

  function setAddressAsProxy(bytes32 id, address impl) external;

  function getAddress(bytes32 id) external view returns (address);

  function getPool() external view returns (address);

  function setPoolImpl(address pool) external;

  function getPoolConfigurator() external view returns (address);

  function setPoolConfiguratorImpl(address configurator) external;

  function getPoolAdmin() external view returns (address);

  function setPoolAdmin(address admin) external;

  function getEmergencyAdmin() external view returns (address);

  function setEmergencyAdmin(address admin) external;

  function getPriceOracle() external view returns (address);

  function setPriceOracle(address priceOracle) external;

  function getRateOracle() external view returns (address);

  function setRateOracle(address rateOracle) external;

  function getBridgeAccessControl() external view returns (address);

  function setBridgeAccessControl(address bridgeAccessControl) external;
}
