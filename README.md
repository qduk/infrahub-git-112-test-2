# Second Infrahub Git integration test repository (1.12)

This repository is the second repository for one scenario of [infrahub-git-112-test](https://github.com/qduk/infrahub-git-112-test): "Regeneration waits for the push of its own repository" (IFC-3220). In that scenario, one merge changes files in both repositories, and only the first repository refuses the push.

## Repository content

This repository has no schema and no objects. It uses the `TestingDevice` kind and the `test_devices` group of the first repository, so add the first repository to Infrahub before this one.

The `main` branch contains:

- one GraphQL query, `second_device_info` (`queries/`)
- a Jinja2 transform, `second_device_config`
- a generator, `second_device_tags`, that creates a `second-role-<role>` tag for each device in `test_devices`
- one artifact definition, `second-device-config`, that targets `test_devices`

Every name starts with `second`, so no name collides with the first repository. The artifact prints `repository: infrahub-git-112-test-2`.

## Scripts

`scripts/push-commit.sh <branch>` pushes a small commit to a branch, to start a new import.
