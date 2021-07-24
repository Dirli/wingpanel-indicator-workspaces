# Wingpanel Workspaces Indicator

Manage your dynamic workspaces from the panel.

<p align="left">
    <a href="https://paypal.me/Dirli85">
        <img src="https://img.shields.io/badge/Donate-PayPal-green.svg">
    </a>
</p>

----

![Screenshot](data/screenshot1.png)

## Building and Installation

### You'll need the following dependencies to build:
* valac
* libgtk-3-dev
* libgranite-dev
* libwnck-3-dev
* libwingpanel-dev
* meson

### How to build
    meson build --prefix /usr
    ninja -C build
    sudo ninja -C build install
