// Parser stub: reads a spec into a typed object. Everything else is yours.
import { readFileSync } from "fs";
import { parse } from "yaml";

export interface Rule { resources: string[]; verbs: string[] }
export interface Quota { cpu: string; memory: string; pods: number }
export interface Spec {
  team: string;
  namespace: string;
  members: { group: string }[];
  access: Rule[];
  quota: Quota;
}

export function loadSpec(path: string): Spec {
  return parse(readFileSync(path, "utf8")) as Spec;
}

if (require.main === module) {
  const path = process.argv[2];
  if (!path) { console.error("usage: index.ts <spec.yaml>"); process.exit(2); }
  const spec = loadSpec(path);
  console.log(`loaded spec for team "${spec.team}", namespace "${spec.namespace}"`);
}
