# Configuration for Remote-Containers VS Code Plugin

This is a configuration for the [Remote-Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) plugin
to enable local Jekyll development.
This way, the GitHub Pages content can be generated and previewed locally, without having to set up Jekyll on the local machine.

Since my dev environment is a [Fedora Linux](https://getfedora.org) installation, with rootless [podman](https://podman.io)
as the container runtime, the default setup for Remote-Containers requires some slight tweaking to make it work.

## Plugin Setup

For the plugin to work with podman, the "Docker Path"-setting needs to be set to "podman".

## Config File Setup

Once the plugin is configured to use podman, the "Add Development Container Configuration Files..." command can be used to generate
a config. There is a predefined Jekyll template that can be used to generate the config, which is how the config for this repo was
created.

Since the assumed default container runtime is Docker, some changes are necessary:

### Home Directory Setup

Since podman uses a rootless user, the default home directory in the container cannot be `root`. Instead, the home directory for the
container user has to be set to some other path for which the user has access, e.g.

```
"containerEnv": {
	"HOME": "/home/vscode"
}
```

With this, the container can be built. However, there might be "permission denied" warnings on container startup.

### SELinux Setup

If during container startup some "permission denied" (or similar) warnings pop up, and an SELinux alert appears, some additional config
changes are required:

```
"runArgs": [ 
	"--userns=keep-id",
	"--security-opt=label=disable" 
]
```

- `--userns=keep-id` is to tell podman to use the host user's UID/GID for the user inside the container (i.e. the user logged into the host OS
    and the user in the container have the same UID/GID)
- `--security-opt=label=disable` disables SELinux separation for the container, which prevents SELinux from blocking access to files (files from
    the host OS mounted into the container) and just spitting out "permission denied" warnings

Despite [podman's troubleshooting guide](https://github.com/containers/podman/blob/main/troubleshooting.md) making it sound as if only one of
those two run args is necessary, the container does not seem to work for me unless both are set. 

## Usage

Once the container is built, and the plugin is connected to it, a terminal in the container can be used to run the `jekyll` command.
Useful commands are `jekyll build` (to build the site), and `jekyll serve` to start a development server with live-reloading.
See the [Jekyll documentation](https://jekyllrb.com) for more information.