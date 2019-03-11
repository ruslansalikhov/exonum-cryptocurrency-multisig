# Cryptocurrency Multisig

The extended version of the
[Cryptocurrency Service](https://github.com/exonum/exonum/tree/master/examples/cryptocurrency-advanced)
implementing multisignature.

[Demo](https://gfycat.com/ru/someyawningdeer)

Exonum blockchain keeps balances of users and handles secure
transactions between them.

It implements most basic operations:

- Create a new user with several keys
- Transfer funds between users

## Install and run

### Using docker

Simply run the following command to start the cryptocurrency service on
on the local machine:

```bash
docker-compose up -d
```

Ready! Find demo at [http://127.0.0.1:8080](http://127.0.0.1:8080).

Docker will automatically build backend and frontend images and run 1 testnet node with public endpoint at `127.0.0.1:8000`
and private ones at `127.0.0.1:9000`.

To stop docker container, use `docker-compose down` command.

### Manually

#### Getting started

Be sure you installed necessary packages:

- [git](https://git-scm.com/downloads)
- [Node.js with npm](https://nodejs.org/en/download/)
- [Rust compiler](https://rustup.rs/)

#### Install and run

Below you will find a step-by-step guide to starting the cryptocurrency
service on 1 testnet node on the local machine.

Build the project:

```sh
cd backend

cargo install --path .
```

Generate testnet config:

<!-- markdownlint-disable MD013 -->

```sh
mkdir example

exonum-cryptocurrency-multisig  generate-testnet 1 --output-dir ./data
```


Run node:

```sh
exonum-cryptocurrency-multisig run --node-config ./data/validators/0.toml --db-path ./data/db --public-api-address 0.0.0.0:8000 --private-api-address 127.0.0.1:9000
```

<!-- markdownlint-enable MD013 -->

Install frontend dependencies:

```sh
cd frontend

npm install
```

Build sources:

```sh
npm run build
```

Run the application:

```sh
npm start -- --port=8080 --api-root=http://127.0.0.1:8000
```

`--port` is a port for Node.JS app.

`--api-root` is a root URL of public API address of one of nodes.

Ready! Find demo at [http://127.0.0.1:8080](http://127.0.0.1:8080).

## Tutorials

- Read the
  [frontend tutorial](https://github.com/exonum/exonum/blob/master/examples/cryptocurrency-advanced/tutorial/frontend.md)
  to get detailed information about the interaction of the client with Exonum blockchain.

## License

Cryptocurrency demo is licensed under the Apache License (Version 2.0).
See [LICENSE](LICENSE) for details.
