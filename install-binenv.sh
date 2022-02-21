#!/opt/homebrew/bin/fish

wget -q https://github.com/devops-works/binenv/releases/latest/download/binenv_darwin_amd64
mv binenv_darwin_amd64 binenv
chmod +x binenv
./binenv update
./binenv install binenv
rm binenv
fish_add_path ~/.binenv
