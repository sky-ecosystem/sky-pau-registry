// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity >=0.8.0;

library Arbitrum {

    /*******************************************************************************************************************

    ███████╗██╗  ██╗██╗   ██╗     █████╗ ██╗   ██╗████████╗██╗  ██╗ ██████╗ ██████╗ ███████╗██████╗ 
    ██╔════╝██║ ██╔╝╚██╗ ██╔╝    ██╔══██╗██║   ██║╚══██╔══╝██║  ██║██╔═══██╗██╔══██╗██╔════╝██╔══██╗
    ███████╗█████╔╝  ╚████╔╝     ███████║██║   ██║   ██║   ███████║██║   ██║██████╔╝█████╗  ██║  ██║
    ╚════██║██╔═██╗   ╚██╔╝      ██╔══██║██║   ██║   ██║   ██╔══██║██║   ██║██╔══██╗██╔══╝  ██║  ██║
    ███████║██║  ██╗   ██║       ██║  ██║╚██████╔╝   ██║   ██║  ██║╚██████╔╝██║  ██║███████╗██████╔╝
    ╚══════╝╚═╝  ╚═╝   ╚═╝       ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ 

    /******************************************************************************************************************/
    /*** SKY PAU Core                                                                                               ***/
    /******************************************************************************************************************/

    address internal constant BEACON                     = 0x86036CE5d2f792367C0AA43164e688d13c5A60A8;  // diamond-pau/Beacon.sol@cbf71b2 (v1.14.0)
    address internal constant PAU_FACTORY                = 0x3968a022D955Bbb7927cc011A48601B65a33F346;  // diamond-pau/PAUFactory.sol@cbf71b2 (v1.14.0)
    address internal constant ADMINISTERED_AGENT_FACTORY = 0xCBA0C0a2a0B6Bb11233ec4EA85C5bFfea33e724d;  // pau-administered-agent/AdministeredAgentFactory.sol@bfaaf70 (v1.0.0)

    /******************************************************************************************************************/
    /*** SKY PAS addresses                                                                                          ***/
    /******************************************************************************************************************/

    address internal constant PAS_BEAM_STATE   = 0x11CFefeA67B18de9046a6250555D438854fFEEDa;  // pas/BeamState.sol@5263f26
    address internal constant PAS_CONFIGURATOR = 0xd11Dc57F3eF23bb7b3142588a461F68460a7C474;  // pas/Configurator.sol@5263f26
    address internal constant PAS_TIMELOCK     = 0x66d3653e66F7edb973549CFA3b46F22298B8f983;  // pas/TimeLock.sol@5263f26

    /******************************************************************************************************************/
    /*** SKY PAU Facets                                                                                             ***/
    /******************************************************************************************************************/

    address internal constant AAVE_FACET           = 0x9f622D74FD49fe7204805B14824eF01B1Cf04333;  // diamond-pau/AaveFacet.sol@b0b7efd (v1.16.0)
    address internal constant CCTP_FACET           = 0xeCCA0D296Cb133081d41E9772B60D57F5fd2798E;  // diamond-pau/CCTPFacet.sol@cbf71b2 (v1.14.0)
    address internal constant ERC4626_FACET        = 0x56220DA4409CA775d574EF3E28Ab584E9c089e9a;  // diamond-pau/ERC4626Facet.sol@b0b7efd (v1.16.0)
    address internal constant LAYER_ZERO_FACET     = 0x21783460499b5a4b2fEA8c9c9B7833420aE5a560;  // diamond-pau/LayerZeroFacet.sol@b0b7efd (v1.16.0)
    address internal constant SPARK_VAULT_FACET    = 0xa293a5CAdC903B005af0cc531BFEEc05213d233C;  // diamond-pau/SparkVaultFacet.sol@b0b7efd (v1.16.0)
    address internal constant TRANSFER_ASSET_FACET = 0xe94A71345C2774f48fE1D6FEa23FdCf906668897;  // diamond-pau/TransferAssetFacet.sol@b0b7efd (v1.16.0)
    address internal constant UNISWAP_V4_FACET     = 0x0260Cd3aC811928696f36c1ff085823c21B4D671;  // diamond-pau/UniswapV4Facet.sol@b0b7efd (v1.16.0)

    /*******************************************************************************************************************

    ███████╗██╗  ██╗██╗   ██╗    ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗ 
    ██╔════╝██║ ██╔╝╚██╗ ██╔╝    ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗
    ███████╗█████╔╝  ╚████╔╝     ██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██║  ██║
    ╚════██║██╔═██╗   ╚██╔╝      ██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██║  ██║
    ███████║██║  ██╗   ██║       ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██████╔╝
    ╚══════╝╚═╝  ╚═╝   ╚═╝       ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═════╝ 

    /******************************************************************************************************************/
    /*** SKY PAS multisig addresses                                                                                 ***/
    /******************************************************************************************************************/

    address internal constant PAS_CBEAM        = 0x492aae70E59551768BAF3c7159d3f951B6ed76Fe;
    address internal constant PAS_CORE_COUNCIL = 0x148eF923d764CBdc1597CcADBbbC66499C1A1432;

}
