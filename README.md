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

- `bash`, `curl`, `unzip`: generic POSIX utilities.
- Also java must be already installed, for ease of use see [asdf-java](https://github.com/halcyon/asdf-java) or look for java in [asdf-all-plugins](https://asdf-vm.com/#/plugins-all)

# Install

Plugin:

        asdf plugin add jmeter
        # or
        asdf plugin add https://github.com/comdotlinux/asdf-jmeter.git

jmeter:

        # Show all installable versions
        asdf list-all jmeter

        # Install specific version
        asdf install jmeter 5.4.1

        # Set a version globally (on your ~/.tool-versions file)
        asdf global jmeter 5.4.1

        # Now jmeter commands are available
        jmeter --version

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# why
Because, installing jmeter is an hassle otherwise.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/comdotlinux/asdf-jmeter/graphs/contributors)!

The Code for bash and zsh paths is copied verbatim from : https://github.com/halcyon/asdf-java

To set JMETER_HOME in your shell's initialization add the following (Untested):

        . ~/.asdf/plugins/jmeter/set-jmeter-home.bash

For zsh shell, instead use:

        . ~/.asdf/plugins/jmeter/set-jmeter-home.zsh

# License

See [LICENSE](LICENSE) © [Guruprasad Kulkarni](https://github.com/comdotlinux/)
