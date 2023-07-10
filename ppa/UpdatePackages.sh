# /bin/bash
# Source : https://assafmo.github.io/2019/05/02/ppa-repo-hosted-on-github.html
# Setting variables
read -p "Enter your PPA e-mail: " PPAEMAIL
read -p "Commit description: " COMMITDESC
# Packages & Packages.gz
dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages

# Release, Release.gpg & InRelease
apt-ftparchive release . > Release
gpg --default-key "$PPAEMAIL" -abs -o - Release > Release.gpg
gpg --default-key "$COMMITDESC" --clearsign -o - Release > InRelease

# Commit & push
git add -A
git commit -m update
git push
