# Contributing

This document provides guidelines for contributing to the module.

## Dependencies

The following dependencies must be installed on the development system:

- [Docker Engine][docker-engine]
- [Google Cloud SDK][google-cloud-sdk]
- [make]

## Generating Documentation for Inputs and Outputs

The Inputs and Outputs tables in the READMEs of the root module,
submodules, and example modules are automatically generated based on
the `variables` and `outputs` of the respective modules. These tables
must be refreshed if the module interfaces are changed.

### Execution

Run `make generate_docs` to generate new Inputs and Outputs tables.

## Integration Testing

Integration tests are used to verify the behaviour of the root module,
submodules, and example modules. Additions, changes, and fixes should
be accompanied with tests.

The general strategy for these tests is to verify the behaviour of the
[example modules](./examples/), thus ensuring that the root module,
submodules, and example modules are all functionally correct.

### Test Environment
The easiest way to test the module is in an isolated test project. The setup for such a project is defined in [test/setup](./test/setup/) directory.

To use this setup, you need a service account with Project Creator access on a folder. Export the Service Account credentials to your environment like so:

```
export SERVICE_ACCOUNT_JSON=$(< credentials.json)
```

You will also need to set a few environment variables:
```
export TF_VAR_org_id="your_org_id"
export TF_VAR_folder_id="your_folder_id"
export TF_VAR_billing_account="your_billing_account_id"
```

With these settings in place, you can prepare a test project using Docker:
```
make docker_test_prepare
```

### Noninteractive Execution

Run `make docker_test_integration` to test all of the example modules
noninteractively, using the prepared test project.

### Interactive Execution

1. Run `make docker_run` to enter developer tools container
2. Run `cft test list` to list available tests
Add a new test or get name of an existing test
3. Run `cft test run <test-name> --stage init --verbose` to initialize the test
This will run a terraform init and terraform validate within the example directory with configuration to be tested. Iteratively develop the Terraform configs in example directory if an error is thrown.
4. Run `cft test run <test-name> --stage apply` --verbose to apply the test configuration
This will run a terraform apply.Iteratively develop the Terraform configs in example directory if an error is thrown. State is persisted locally, so this is safe to rerun and idempotent.
5. Run `cft test run <test-name> --stage verify --verbose` to execute the verification tests. These are the statements used to assert data received from gcloud (or API) is what we expected.
Iterate on the test/integration/example-name/example_name_test.go verify stage.
6. Run `cft test run <test-name> --stage teardown --verbose` to teardown any resources.
7. Rerun `cft test run <test-name> --verbose` without an explicit stage to test all stages from init to teardown to validate e2e works as expected.

## Linting and Formatting

Many of the files within your blueprint repository can be linted or formatted to maintain a standard of quality. Lint tests usually validate that
- Terraform config formatted via `terraform fmt`
- Trailing whitespaces removed
- Auto generated docs up to date
- Auto generated code if any are up to date
- File headers are correct

### Execution

Run `make docker_test_lint`.

[docker-engine]: https://www.docker.com/products/docker-engine
[flake8]: http://flake8.pycqa.org/en/latest/
[gofmt]: https://golang.org/cmd/gofmt/
[google-cloud-sdk]: https://cloud.google.com/sdk/install
[hadolint]: https://github.com/hadolint/hadolint
[inspec]: https://inspec.io/
[kitchen-terraform]: https://github.com/newcontext-oss/kitchen-terraform
[kitchen]: https://kitchen.ci/
[make]: https://en.wikipedia.org/wiki/Make_(software)
[shellcheck]: https://www.shellcheck.net/
[terraform-docs]: https://github.com/segmentio/terraform-docs
[terraform]: https://terraform.io/
