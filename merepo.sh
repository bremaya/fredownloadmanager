#/bin/bash
#Created by Breno Maia (https://github.com/bremaya)
wget -q -O- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft-edge.gpg > /dev/null 2>&1 &&
echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge/ stable main" | sudo tee /etc/apt/sources.list.d/microsoft-edge.list
