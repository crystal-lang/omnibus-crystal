1. Download crystal from GitHub and place it as crystal-darwin-x86_64, crystal-linux-x86_64 and crystal-linux-i686
2. Change default_version in ./config/software/crystal.rb
3. Change default_version in ./config/software/shards.rb
4. Follow the uncommented procedures described in each of the release_*.sh files
5. Upload pkg/... to GitHub.
6. Run the other procedures of each of the release_*.sh files
7. Run ./dist/sync.sh
8. Change version and shasum in homembrew_crystal project.
9. Update docker image

Note: If the initial build fails with git complaining there's no HEAD, remove the llvm_bin dependency
from config/software/crystal.rb, run the build again and let fail and then undo the changes and try again.
