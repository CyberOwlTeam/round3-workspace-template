# Option A: Helm chart for two squads

What's here:

- `service/`: a tiny HTTP service (200 on `/healthz`, echoes JSON on `/`) with its `Dockerfile`. Image: `ghcr.io/cyberowlteam/r3-echo:0.1.0` (you don't need to build it).
- `chart/`: a skeleton chart. `Chart.yaml` exists; `templates/` is empty; `values.yaml`, `values-dev.yaml` and `values-staging.yaml` are empty.
- `TEAMS.md`: the two squads that will consume the chart.

Render without a cluster:

```bash
helm template demo chart -f chart/values-dev.yaml
```

## Install

## Environments

## Configuration
