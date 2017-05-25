# -*- coding: utf-8 -*-
# Config file for master.py

#######
# GIT
#######

# A polling time in seconds to detect changes into git repositories
polling_time = 120

# List with apps names. The name is the same that repository into github organization gv10-team
# If you add a new app builbot managed this

apps_gv10 = [
#    "guadalinexv10-config-assistant",
#    "guadalinexv10-firstart",
#    "guadalinexv10-agent",
]

# List with metapkgs names. The name is the same that repository into github organization gv10-team
# If you add a new metapkgs builbot managed this

metapkgs_gv10 = [
    "guadalinexv10-meta",
    "guadalinexv10-light-meta",
    "guadalinexv10-artwork",
    "guadalinexv10-skel-conf",
    "guadalinexv10-system-conf",
#    "guadalinexv10-help-mantis",
    "guadalinexv10-light-artwork",
    "guadalinexv10-light-lxde-common-conf",
    "guadalinexv10-mint-artwork-cinnamon-conf",
    "guadalinexv10-mint-artwork-common-conf",
    "guadalinexv10-mint-x-icons-conf",
#    "guadalinexv10-casper-conf",
#    "guadalinexv10-ubiquity-conf",
    "guadalinexv10-cinnamon-conf",
#    "guadalinexv10-firefox-24.2.0",
#    "guadalinexv10-thunderbird-esr",
#    "guadalinexv10-thunderbird-esr-conf",
#    "guada-firefox-cert",
    "ubiquity-slideshow-guada",
]


metapkgs = [
     "gecosws-icon-theme",
     "gecosws-mdm-theme",
#     "gecosws-firerfox-wrapper",
     "gecosws-ubiquity",
]

apps = [

]
# Indicates if we should abort the integration process if we have any linitian errors
halt_on_lintian_error = False

# Script live-build
livebuild_gv10 = "sudo /var/gensys/live-build/guadalinexv10/buildgv10.sh"
livebuild_gv10_lite = "sudo /var/gensys/live-build/guadalinexv10-lite/buildgv10lite.sh"

# Codename of repository
codename_gv10 = "cerdo"

# Pdebuild custom commands
#pdebuild = "pdebuild --configfile /var/gensys/.pbuilderrc"
pdebuild = "pdebuild --configfile /var/gensys/.pbuilderrc"

# Path of own repository
repo_dir_gv10 = "/var/gensys/deb-repositories/guadalinex"

rawimage_gv10 = "/var/gensys/live-build/guadalinexv10/binary.hybrid.iso"
rawimage_gv10_lite = "/var/gensys/live-build/guadalinexv10-lite/binary.hybrid.iso"
ftpimage_gv10 = "/var/gensys/deb-repositories/isos/guadalinexv10-desktop-64bits.iso"
ftpimage_gv10_lite = "/var/gensys/deb-repositories/isos/guadalinexv10-lite-desktop-32bits.iso"


gensys_gv10_time = "04:00"
gensys_gv10_lite_time = "06:00"

