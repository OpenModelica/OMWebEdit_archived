import React from "react";
import ReactDOM from "react-dom";
import "./index.css";
import { Application } from "./Application";
import { AppWidget } from "./dnd/AppWidget";

ReactDOM.render(
  <AppWidget app={new Application()} />,
  document.getElementById("root")
);
