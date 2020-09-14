import React from "react";
import ReactDOM from "react-dom";
import "./index.css";
import { AppWidget } from "./AppWidget";

ReactDOM.render(<AppWidget />, document.getElementById("root"));
console.log(`${process.env.REACT_APP_VERSION}`);
