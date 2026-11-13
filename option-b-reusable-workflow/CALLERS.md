# Who would call the reusable workflow

- **telemetry-api** (Athena): Go service, deploys every few days, wants canary on every tag.
- **vessel-sync** (Jambo): Python service, deploys rarely, has never used canary and wants to keep doing plain deploys.

Both currently copy-paste `build.yml` and edit it by hand.
