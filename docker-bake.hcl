group "default" {
    targets = [
        "latest",
        "latest_root",
    ]
}

target "cross_platform" {
    platforms = [
        "linux/amd64",
        "linux/arm64",
    ]
}

target "root" {
    args = {
        USERNAME = "root"
    }
}

target "dockerfile" {
    dockerfile = "./Dockerfile"
}

target "version" {
    args = {
        NIX_VERSION = "2.20.1",
        DEVBOX_VERSION = "0.9.1",
    }
}

target "latest" {
    inherits = ["version", "dockerfile", "cross_platform"]
    tags =[
        "ghcr.io/sambyeol/devbox-devcontainer:0.8.7",
        "ghcr.io/sambyeol/devbox-devcontainer:0.8",
        "ghcr.io/sambyeol/devbox-devcontainer:0",
        "ghcr.io/sambyeol/devbox-devcontainer:latest",
    ]
}

target "latest_root" {
    inherits = ["version", "dockerfile", "root", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/devbox-devcontainer:0.8.7-root",
        "ghcr.io/sambyeol/devbox-devcontainer:0.8-root",
        "ghcr.io/sambyeol/devbox-devcontainer:0-root",
        "ghcr.io/sambyeol/devbox-devcontainer:latest-root",
    ]
}
