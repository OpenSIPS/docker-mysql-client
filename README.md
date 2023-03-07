# MySQL Client Docker

Docker recipe for running MySQL Client commands

## Behavior

The container creates the `/etc/mysql/my.cnf` configuration based on the
[environment](#environment) variables defined when starting the container. This
file is being used by all the commands run in the container.
The container can run in two different modes:
* script mode: if the first parameter passed when starting the container is a
script file that ends in `.sh`, the container runs that command with the
provided arguments; note that the argument should point to a file that exists
in the container; otherwise the container runs in client mode
* client mode: if the container does not point to a file, all the arguments
are being passed to the `mysql` command, resulting in running a single query

## Environment

The container can receive the following environment variables:
* `MYSQL_HOME`: indicates the home directory where MySQL searches for the
`my.cnf` configuration file
* `MYSQL_USER`: the user to run mysql commands
* `MYSQL_PASSWORD`: the default password used when running mysql commands
`my.cnf` configuration file
* `MYSQL_HOST`: the host of the MySQL server to connect to
* `MYSQL_PORT`: the port of the MySQL server to connect to
* `MYSQL_DATABASE`: the name of the default MySQL server
* `MYSQL_OPTIONS`: extra MySQL options to be configured on the client side;
their format is `key1 = value1\r\nkey2 = value2`

## Building the image
You can build the docker image by running:
```
make build
```

This command will build a docker image with MySQL Client tool.

## Run

To run a bash script, pass it as a paramater:
```
docker run -d --name mysql-client opensips/mysql-client:latest script.sh
```
To run a single mysql command, use:
```
docker run -d --name mysql-client opensips/mysql-client:latest -s mysql 'select * from user'
```
