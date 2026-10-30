from provisioner import load_spec


def test_loads_valid_spec():
    spec = load_spec("../specs/team-payments.yaml")
    assert spec.namespace == "payments-dev"
