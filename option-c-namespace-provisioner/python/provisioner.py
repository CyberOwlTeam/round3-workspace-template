"""Parser stub: reads a spec into dataclasses. Everything else is yours."""
from __future__ import annotations

import sys
from dataclasses import dataclass, field

import yaml


@dataclass
class Rule:
    resources: list[str]
    verbs: list[str]


@dataclass
class Quota:
    cpu: str
    memory: str
    pods: int


@dataclass
class Spec:
    team: str
    namespace: str
    members: list[dict] = field(default_factory=list)
    access: list[Rule] = field(default_factory=list)
    quota: Quota | None = None


def load_spec(path: str) -> Spec:
    with open(path, encoding="utf-8") as fh:
        raw = yaml.safe_load(fh)
    return Spec(
        team=raw["team"],
        namespace=raw["namespace"],
        members=raw.get("members", []),
        access=[Rule(**r) for r in raw.get("access", [])],
        quota=Quota(**raw["quota"]) if "quota" in raw else None,
    )


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit("usage: provisioner.py <spec.yaml>")
    spec = load_spec(sys.argv[1])
    print(f"loaded spec for team {spec.team!r}, namespace {spec.namespace!r}")
