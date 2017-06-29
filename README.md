crystal Omnibus project
=======================

> **Hi there!** This README.md doesn't seem useful as is. If you're trying to
> make a new Crystal release, please see [HowToRelease.md](HowToRelease.md).
> We'll _eventually_ update the README with that info - but not today

This project creates full-stack platform-specific packages for
`crystal`!

Installation
------------
You must have a sane Ruby 1.9+ environment with Bundler installed. Ensure all
the required gems are installed:

```shell
$ bundle install --binstubs
```

Usage
-----
### Build

Make sure to create and have permissions to the following directories:

* `/opt/crystal`
* `/var/cache`

You create a platform-specific package using the `build project` command:

```shell
$ bin/omnibus build crystal
```

The platform/architecture type of the package created will match the platform
where the `build project` command is invoked. For example, running this command
on a MacBook Pro will generate a Mac OS X package. After the build completes
packages will be available in the `pkg/` folder.

#### Troubleshooting

- If the initial build fails with git complaining there's no HEAD, run the build setting the environment variable `FIRST_RUN`, run the build again and let it fail, and then unset the variable and try again.
- If autoreconf fails with: `Can't exec "aclocal": Permission denied at .../autoconf/Autom4te/FileUtils.pm line 326`, then reinstall autoconf and automake from source by running `brew reinstall autoconf automake --build-from-source`.
- If the build fails because `llvm_config` is not found, either install llvm35 via `brew install llvm35`, or link the `llvm` package.
- If compiling crystal fails, make sure to download the crystal binary from GitHub and place it as crystal-darwin-x86_64, crystal-linux-x86_64 and crystal-linux-i686.

### Clean

You can clean up all temporary files generated during the build process with
the `clean` command:

```shell
$ bin/omnibus clean crystal
```

Adding the `--purge` purge option removes __ALL__ files generated during the
build including the project install directory (`/opt/crystal`) and
the package cache directory (`/var/cache/omnibus/pkg`):

```shell
$ bin/omnibus clean crystal --purge
```

### Publish

Omnibus has a built-in mechanism for releasing to a variety of "backends", such
as Amazon S3. You must set the proper credentials in your `omnibus.rb` config
file or specify them via the command line.

```shell
$ bin/omnibus publish path/to/*.deb --backend s3
```

### Help

Full help for the Omnibus command line interface can be accessed with the
`help` command:

```shell
$ bin/omnibus help
```

Kitchen-based Build Environment
-------------------------------
Every Omnibus project ships will a project-specific
[Berksfile](http://berkshelf.com/) that will allow you to build your omnibus projects on all of the projects listed
in the `.kitchen.yml`. You can add/remove additional platforms as needed by
changing the list found in the `.kitchen.yml` `platforms` YAML stanza.

This build environment is designed to get you up-and-running quickly. However,
there is nothing that restricts you to building on other platforms. Simply use
the [omnibus cookbook](https://github.com/opscode-cookbooks/omnibus) to setup
your desired platform and execute the build steps listed above.

The default build environment requires Test Kitchen and VirtualBox for local
development. Test Kitchen also exposes the ability to provision instances using
various cloud providers like AWS, DigitalOcean, or OpenStack. For more
information, please see the [Test Kitchen documentation](http://kitchen.ci).

Once you have tweaked your `.kitchen.yml` (or `.kitchen.local.yml`) to your
liking, you can bring up an individual build environment using the `kitchen`
command.

```shell
$ bin/kitchen converge ubuntu-1204
```

Then login to the instance and build the project as described in the Usage
section:

```shell
$ bundle exec kitchen login ubuntu-1204
[vagrant@ubuntu...] $ cd crystal
[vagrant@ubuntu...] $ bundle install
[vagrant@ubuntu...] $ ...
[vagrant@ubuntu...] $ bin/omnibus build crystal
```

For a complete list of all commands and platforms, run `kitchen list` or
`kitchen help`.
