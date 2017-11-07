1. Edit `prepare_release.bash` to update the `CRYSTAL_PREVIOUS_VERSION` and `CRYSTAL_RELEASE_VERSION` variables, and update the `SHARDS_VERSION` and MD5 in `config/software/shards.rb`.
2. Get a working OSX El Capitan Vagrant box named `osx-el-capitan`. [This tutorial](https://spin.atomicobject.com/2015/11/17/vagrant-osx/) has proved helpful for that.
3. Run `./prepare_release.bash`. This will take really long, and ask you your GPG passphrase a couple of times.
4. Upload the 3 `.tar.gz`s and the `.pkg` files in `pkg/` to the Github Release page.
5. Run `./dist/sync` to publish the Debian repo.
6. Send a PR updating [crystal-lang's Homebrew formula](https://github.com/Homebrew/homebrew-core/edit/master/Formula/crystal-lang.rb).
7. Update docker image
8. 🎉🎉🎉
