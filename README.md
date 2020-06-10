# OMWebEdit
OpenModelica connection editor in the browser

## Requirements

Should support drag-and-drop (and textual) composition of:
- Modelica models
- composite FMU models (SSP)

The [OMWebEdit](https://github.com/OpenModelica/OMWebEdit) will be the front-end (running in the browser) and 
[OMWebService](https://github.com/OpenModelica/OMWebService) will be the backend (on some external server).

## Timeline

### First phase functionality - simulate already existing models
- [ ] no text support
- [ ] upload Modelica libraries (as zip files) or SSPs to the backend
- [ ] backend returns the model diagrams
- [ ] setup a simulation (start time, stop time, solver, etc)
- [ ] simulate the model (in the backend)
- [ ] plot the data (in the front-end)

### Second phase functionality - compose models
- [ ] no text support
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




