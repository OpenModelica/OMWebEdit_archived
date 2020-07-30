import styled from "@emotion/styled";
import React from "react";
import { LibraryItemWidget } from "./LibraryItemWidget";
import { Application } from "../Application";

export interface LibraryWidgetProps {
  app: Application;
}

export const Library = styled.div`
  min-width: 200px;
  background: rgb(30, 30, 30);
  flex-grow: 0;
  flex-shrink: 0;
`;

export const WidgetHeaderBar = styled.div`
  color: white;
  font-family: Helvetica, Arial;
  padding: 5px;
  border-radius: 5px;
  margin: 10px;
  cursor: pointer;
`;

export class LibraryWidget extends React.Component<LibraryWidgetProps> {
  render() {
    return (
      <Library>
        <WidgetHeaderBar>Component Library</WidgetHeaderBar>
        <LibraryItemWidget
          nodeEventData={{
            componentId: "Modelica.Electrical.Analog.Basic.Inductor",
          }}
          name="Inductor"
          color="rgb(192,255,0)"
        />
        <LibraryItemWidget
          nodeEventData={{
            componentId: "Modelica.Electrical.Analog.Basic.Ground",
          }}
          name="Ground"
          color="rgb(0,192,255)"
        />
      </Library>
    );
  }
}
