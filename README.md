<div align="center">

# asdf-jmeter ![Build](https://github.com/comdotlinux/asdf-jmeter/workflows/Build/badge.svg) ![Lint](https://github.com/comdotlinux/asdf-jmeter/workflows/Lint/badge.svg)

[jmeter](https://jmeter.apache.org/usermanual/index.html) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add jmeter
# or
asdf plugin add https://github.com/comdotlinux/asdf-jmeter.git
```

jmeter:

```shell
# Show all installable versions
asdf list-all jmeter

# Install specific version
asdf install jmeter latest

# Set a version globally (on your ~/.tool-versions file)
asdf global jmeter latest

# Now jmeter commands are available
jmeter --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/comdotlinux/asdf-jmeter/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Guruprasad Kulkarni](https://github.com/comdotlinux/)
