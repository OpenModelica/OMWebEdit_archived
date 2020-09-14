[![CI](https://github.com/OpenModelica/OMWebEdit/workflows/CI/badge.svg?branch=master)](https://github.com/OpenModelica/OMWebEdit/actions)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [OMWebEdit](#omwebedit)
- [Developer Guide](#developer-guide)
  - [Dev Env Pre-requisites](#dev-env-pre-requisites)
  - [Running Locally](#running-locally)
  - [Automated Checks and Tests](#automated-checks-and-tests)
    - [Static Checks](#static-checks)
    - [Tests](#tests)
  - [Continuous Integration Checks](#continuous-integration-checks)
  - [Deploying Using Serverless Framework](#deploying-using-serverless-framework)
    - [Build for Deployment](#build-for-deployment)
    - [Init Serverless Stack](#init-serverless-stack)
    - [Deploy API-Docs to S3](#deploy-api-docs-to-s3)
    - [Remove Serverless Stack](#remove-serveless-stack)
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

## Automated Checks and Tests

The project uses a combination of static checks and automated tests to ensure quality.

### Static Checks

Static checks can be run using the following command

```
npm run test:static
```

This command does the following:

- Compiles all [TypeScript](https://www.typescriptlang.org/) code to check for any compilation errors
- Runs [ESLint](https://eslint.org/) checks
- Runs [Prettier](https://prettier.io/) checks

All static checks are also run before any commit is accepted, using a pre-commit hook configured using
[Husky](https://github.com/typicode/husky).

### Tests

The project uses the following category of tests

1. Integration, Component and Unit Tests  
   These are written using [React-Testing-Library](https://testing-library.com/docs/react-testing-library/intro). These
   tests don't startup the full application for quick feedback, but still uses actual DOM nodes while testing just like
   a real user does. These tests use a Test Double for any downstream dependencies to ensure speed of execution.
   Run these tests using the following command:
   ```
   npm run test
   ```
1. E2E tests  
   These are [black-box tests](https://en.wikipedia.org/wiki/Black-box_testing) written using
   [Cypress](https://www.cypress.io/).  
   Run these tests using the following command (the app should be running as a pre-requisite):
   ```
   npm run cy:open
   ```

## Continuous Integration Checks

A series of static checks and tests are run as part of the CI workflow. For details, refer:
[ci-cd.yml](.github/workflows/ci-cd.yml). Environment variables (capturing non-sensitive information) for use in E2E
tests are defined in [ci-cd.yml](.github/workflows/ci-cd.yml).

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

### Deploy to S3

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
