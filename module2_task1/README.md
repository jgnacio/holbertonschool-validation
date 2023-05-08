# Golang HTTP Web Server

This repository contains a simple HTTP web server written in the Golang language, which listens to incoming HTTP requests on `localhost:9999`. The following functionalities are implemented:

- If a request hits the path `/` (e.g., `http://localhost:9999/` or `http://localhost:9999`), a `404 Not Found` response is returned as the homepage is not implemented in this task.
- If a request hits the path `/health` (e.g., `http://localhost:9999/health`), the server returns the message `ALIVE` if it is up and running.

## Prerequisites

* [Git](http://https://git-scm.com/book/en/v2/Getting-Started-Installing-Git "Git")
* [Go](http://https://go.dev/dl/ "Go") version 1.18 or later

## Project Setup

With Golang installed in your environment, you can initialize a new project with the following commands:

```bash
git clone https://github.com/jgnacio/holbertonschool-validation.git
cd holbertonschool-validation/module2_task0
```

After initializing the project, run the command:
```bash
make build
``` 
to generate the binary and necesary files, then
run the server with:
```bash
make run
```


## Project Life-cycle

The life-cycle of this project is defined by the following goals:

- `build`: compile the source code of the application to a binary named `awesome-api` with the command `make build`. The first build may take some time.
- `run`: run the application in the background by executing the binary `awesome-api` and write logs into a file named `awesome-api.log` with the command `./awesome-api >./awesome-api.log 2>&1 &`.
- `stop`: stop the application with the command `kill <pid-of-awesome-api>` where `<pid-of-awesome-api>` is the Process ID of the application. For instance, `kill "$(pgrep awesome-api)"`.
- `clean`: stop the application, delete the binary `awesome-api` and the log file `awesome-api.log`.
- `test`: test the application to ensure that it behaves as expected.

