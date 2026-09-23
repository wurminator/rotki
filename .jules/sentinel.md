## 2024-05-16 - Hardcoded API Key Fallback
**Vulnerability:** A hardcoded API key (`d943ea1af415001154223fdf46b6f193`) was used as a fallback for The Graph API in `rotkehlchen/externalapis/graph.py`.
**Learning:** Hardcoded secrets (even free/fallback tier ones) shouldn't exist in source code as they can easily be scraped, exposing the infrastructure to abuse and causing accidental leakage of API credentials.
**Prevention:** Remove fallback logic relying on hardcoded keys and fail securely instead, throwing a relevant error (e.g. `APIKeyNotConfigured`) and informing the user gracefully without exposing internal secrets.
