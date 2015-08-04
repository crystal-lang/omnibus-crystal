1. Download crystal from GitHub and place it as crystal-darwin-x86_64, crystal-linux-x86_64 and crystal-linux-i686
1. Change default_version in ./config/software/crystal.rb
1. Follow the uncommented procedures described in each of the release_*.sh files
1. Upload pkg/... to GitHub.
1. Run the commented procedures of each of the release_*.sh files
1. Run ./dist/sync.sh
1. Change version and shasum in homembrew_crystal project.
