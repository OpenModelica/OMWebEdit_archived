<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [OMWebEdit](#omwebedit)
- [Developer Guide](#developer-guide)
  - [Dev Env Pre-requisites](#dev-env-pre-requisites)
  - [Running Locally](#running-locally)
- [Project Information and Management](#project-information-and-management)
  - [Requirements](#requirements)
  - [Timeline](#timeline)
    - [First phase functionality - simulate already existing models](#first-phase-functionality---simulate-already-existing-models)
    - [Second phase functionality - compose models](#second-phase-functionality---compose-models)
    - [Third phase functionality - collaborative development](#third-phase-functionality---collaborative-development)
  - [Web Frameworks](#web-frameworks)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# OMWebEdit
OpenModelica connection editor in the browser

# Developer Guide
This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Dev Env Pre-requisites
```
❯ node --version
v12.18.1

❯ npm --version
6.14.5
```

## Running Locally
1. Install dependencies 
    ```
    npm install
    ```  
1. Run
    ```
    npm run start
    ```

## Deploying Using Serverless Framework
### Build for Deployment
```
npm run build
```
### Init Serverless Stack
Doesn't need re-running each time. Only required once to create "serverless stack"
```
sls deploy
```
### Deploy API-Docs to S3
```
sls s3deploy
```
### Remove Serveless Stack
```
sls remove
```

# Project Information and Management

## Requirements

Should support drag-and-drop (and textual) composition of:
- Modelica models
- composite FMU models (SSP)

The [OMWebEdit](https://github.com/OpenModelica/OMWebEdit) will be the front-end (running in the browser) and 
[OMWebService](https://github.com/OpenModelica/OMWebService) will be the backend (on some external server).

## Timeline

### First phase functionality - simulate already existing models
- no text support
- [ ] upload Modelica libraries (as zip files) or SSPs to the backend
- [ ] backend returns the model diagrams
- [ ] setup a simulation (start time, stop time, solver, etc)
- [ ] simulate the model (in the backend)
- [ ] plot the data (in the front-end)

### Second phase functionality - compose models
- no text support
- [ ] upload Modelica libraries (as zip files) or FMUs to the backend
- [ ] backend returns the library components or FMUs as icons with port data
- [ ] drag-and-drop these Modelica components or FMUs and connect them
- [ ] edit the component / FMU parameters
- [ ] setup a simulation (start time, stop time, solver, etc)
- [ ] simulate the model (in the backend)
- [ ] plot the data (in the front-end)

### Third phase functionality - collaborative development
- [ ] text support, edit and create Modelica models and libraries in the browser, including icons, etc.
- [ ] collaborative editing of Modelica models, conflict solving, integration with git/svn repositories

## Web Frameworks

Possible web frameworks to use:
- https://www.diagrams.net/
- https://github.com/jgraph/drawio (web app)
- https://github.com/jgraph/drawio-desktop (desktop app, electron based)
