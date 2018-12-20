# Functional Core / Imperative Shell Example

This repository is a much simplified **Hello World** example of **Cloud Native Applications**.

## Getting Started

This is a [Nodejs](https://nodejs.org/en/) project, and while its possible to run `npm install` its _strongly suggested_ to use the more integrated and immutable approach.

[Nix](https://nixos.org/nix/) is required to use this repository effectively.

```
curl https://nixos.org/nix/install | sh
```

[Nix From NPM](https://github.com/adnelson/nixfromnpm) is also required to bridge NIX and NPM.

```
git clone https://github.com/adnelson/nixfromnpm /tmp/nixfromnpm
cd /tmp/nixfromnpm
nix-env --install --attr nixfromnpm --file ./release.nix
```

Git Submodule should be checked out as well with:

```
git submodule update --remote
```

Your system now has the ability to reproduce the **exact** production used in the Docker Container, and all developers are guaranteed to have the same development environment.

Commands are available in the `./cmd` directory and should all be run from the root project directory i.e. `./cmd/update`. At this time running them in the cmd directory will break

- **build**: creates a production and debug docker container.
- **dev**: creates a isolated development environment with necessary dependencies. Its a shallow version of `npm install --development` so development dependencies are flattened showing exactly what's required for development.
- **prod**: creates the same production environment as is deployed in the container (slight difference in file structure as the `.container-ignore` file isn't passed for this environment)
- **update**: for those coming from npm this is slightly different, as the environments are managed via a nix to npm bridge. To update package.json run this command and it will take care of the heavy lifting and run tests on the project.

## Commits

Enter the development environment and run `npm run commit` this will make use of conventionalcommits and all the necessary pre and post git hooks to maintain code quality
