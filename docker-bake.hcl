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
        NIX_VERSION = "2.21.1",
        DEVBOX_VERSION = "0.10.3",
    }
}

target "latest" {
    inherits = ["version", "dockerfile", "cross_platform"]
    tags =[
        "ghcr.io/sambyeol/devbox-devcontainer:0.10.3",
        "ghcr.io/sambyeol/devbox-devcontainer:0.10",
        "ghcr.io/sambyeol/devbox-devcontainer:0",
        "ghcr.io/sambyeol/devbox-devcontainer:latest",
    ]
}

target "latest_root" {
    inherits = ["version", "dockerfile", "root", "cross_platform"]
    tags = [
        "ghcr.io/sambyeol/devbox-devcontainer:0.10.3-root",
        "ghcr.io/sambyeol/devbox-devcontainer:0.10-root",
        "ghcr.io/sambyeol/devbox-devcontainer:0-root",
        "ghcr.io/sambyeol/devbox-devcontainer:latest-root",
    ]
}
