import styled from "@emotion/styled";
import React from "react";
import { LibraryItemWidget } from "./LibraryItemWidget";
import { Application } from "../Application";
import { OMComponent } from "../domain-model/OMComponent";

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
  font-family: Helvetica, Arial, serif;
  padding: 5px;
  border-radius: 5px;
  margin: 10px;
  cursor: pointer;
`;

export class LibraryWidget extends React.Component<LibraryWidgetProps> {
  render() {
    let libraryItemWidgets: JSX.Element[] = [];
    this.props.app
      .getComponentLibrary()
      .getAllComponents()
      .forEach((component) => {
        libraryItemWidgets.push(this.getLibraryItemWidget(component));
      });
    return (
      <Library>
        <WidgetHeaderBar>Component Library</WidgetHeaderBar>
        {libraryItemWidgets}
      </Library>
    );
  }

  private getLibraryItemWidget(component: OMComponent) {
    return (
      <LibraryItemWidget
        nodeEventData={{
          componentId: component.iconId,
        }}
        key={component.iconId}
        name={component.displayLabel}
      />
    );
  }
}
