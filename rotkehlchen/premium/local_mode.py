"""Local premium mode for this personal build.

Unlocks all locally enforced premium functionality (event/pnl/report limits,
user notes, NFT limits, ETH staking tracking, asset movement matching,
Gnosis Pay / Monerium / MCP gates) without any rotki.com credentials and
without contacting any rotki-operated server.

Cloud-delivered features stay disabled: the premium statistics graphs, the
ETH staking premium view (their components are served from rotki.com),
watchers, premium device management and the encrypted database backup sync
all require rotki servers and cannot work offline.
"""
from typing import Final

LOCAL_PREMIUM_MODE: Final = True
LOCAL_PREMIUM_TIER: Final = 'Advanced'

# -1 is rotki's convention for an unlimited limit
LOCAL_HISTORY_EVENTS_LIMIT: Final = -1
LOCAL_PNL_EVENTS_LIMIT: Final = -1
LOCAL_REPORTS_LOOKUP_LIMIT: Final = -1
# eth2.py compares `new_total > limit` so -1 would always trip the check
LOCAL_ETH_STAKED_LIMIT: Final = 1_000_000_000

# keyed by UserLimitType values
LOCAL_USER_LIMITS: Final = {
    'history_events_limit': LOCAL_HISTORY_EVENTS_LIMIT,
    'pnl_events_limit': LOCAL_PNL_EVENTS_LIMIT,
    'reports_lookup_limit': LOCAL_REPORTS_LOOKUP_LIMIT,
    'eth_staked_limit': LOCAL_ETH_STAKED_LIMIT,
}

# Capabilities unlocked by local mode. eth_staking_view and graphs_view stay
# off because their views load premium components from rotki.com.
LOCAL_CAPABILITIES: Final = {
    'asset_movement_matching': True,
    'event_analysis_view': True,
    'gnosispay': True,
    'monerium': True,
    'mcp': True,
    'eth_staking_view': False,
    'graphs_view': False,
}

# Cloud backup stays disabled
LOCAL_MAX_BACKUP_SIZE_MB: Final = 0

# API resources whose handlers talk to rotki.com. They remain gated in local
# mode because they cannot work without the rotki servers.
CLOUD_PREMIUM_RESOURCES: Final = frozenset({
    'PremiumDevicesResource',
    'StatisticsRendererResource',
    'WatchersResource',
})
