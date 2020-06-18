// SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0;

import "./ISuperToken.sol";
import "./ISuperAgreement.sol";

/**
 * @title Superfluid's flow agreement interface
 * @author Superfluid
 */
abstract contract IFlowAgreement is ISuperAgreement {

    /// @notice Update the flow between `msg.sender` and `receiver` with a flow rate of `flowRate` in token@`token`.
    /// @param token Super token address.
    /// @param receiver Flow sender address.
    /// @param receiver Flow receiver address.
    /// @param flowRate New flow rate in amount per second.
    /// @dev Sender must be msg.sender or meta transaction relayer.
    function updateFlow(
        ISuperToken token,
        address sender,
        address receiver,
        int256 flowRate
    )
        external
        virtual;

    /// @notice Get the current flow rate between `sender` and `receiver`.
    /// @param token Super token address.
    /// @param receiver Flow sender address.
    /// @param receiver Flow receiver address.
    /// @return flowRate Flow rate.
    function getFlow(
       ISuperToken token,
       address sender,
       address receiver
    )
        external
        view
        virtual
        returns (int256 flowRate);

    /// @notice Get the net flow rate of the `account` in token@`token`.
    /// @param token Super token address.
    /// @param account Account for the query.
    /// @return flowRate Flow rate.
    function getNetFlow(
       ISuperToken token,
       address account)
       external
       view
       virtual
       returns (int256 flowRate);

    /// @notice Flow updated event.
    /// @param token Super token address.
    /// @param sender Flow sender address.
    /// @param receiver Flow recipient address.
    /// @param flowRate Flow rate in amount per second for this flow.
    /// @param flowRate Total flow rate in amount per second for the sender.
    /// @param flowRate Total flow rate in amount per second for the receiver.
    event FlowUpdated(
        ISuperToken indexed token,
        address indexed sender,
        address indexed receiver,
        int256 flowRate,
        int256 totalSenderFlowRate,
        int256 totalReceiverFlowRate
    );

    /// @notice Delete the flow between `sender` and `receiver`.
    /// @param token Super token address.
    /// @param sender Flow sender address.
    /// @param receiver Flow receiver address.
    function deleteFlow(
        ISuperToken token,
        address sender,
        address receiver
    )
        external
        virtual;

}
