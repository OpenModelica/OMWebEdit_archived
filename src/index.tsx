import React from "react";
import ReactDOM from "react-dom";
import "./index.css";
import { Application } from "./Application";
import { BodyWidget } from "./dnd/BodyWidget";

ReactDOM.render(
  <BodyWidget app={new Application()} />,
  document.getElementById("root")
);
