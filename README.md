<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [OMWebEdit](#omwebedit)
- [Developer Guide](#developer-guide)
  - [Available Scripts](#available-scripts)
    - [`npm start`](#npm-start)
    - [`npm test`](#npm-test)
    - [`npm run build`](#npm-run-build)
    - [`npm run eject`](#npm-run-eject)
  - [Learn More](#learn-more)
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

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.<br />
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.<br />
You will also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.<br />
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.<br />
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.<br />
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can’t go back!**

If you aren’t satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you’re on your own.

You don’t have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn’t feel obligated to use this feature. However we understand that this tool wouldn’t be useful if you couldn’t customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

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
