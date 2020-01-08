# portainer-setup
Some simple scripts to get Portainer with an Agent up and running quickly

## Usage

To install and start Portainer, run the following commands

`git clone https://github.com/Sharknoon/portainer-setup.git`

`cd portainer-setup`

`sudo sh run-portainer.sh`

This creates two containers, portainer itself and the portainer agent, which allows you to dig deeper into the system, e.g. exploring volumes and add/remove files from them directly in the web interface.

After that, simply go to `http://localhost:9000/` and have fun using portainer 
