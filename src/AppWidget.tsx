import * as React from "react";
import { ComponentLibraryWidget } from "./drag-n-drop/ComponentLibraryWidget";
import { Application } from "./Application";
import { NodeEventData } from "./drag-n-drop/LibraryItemWidget";
import { CanvasWidget } from "@projectstorm/react-canvas-core";
import styled from "@emotion/styled";
import { OMComponent } from "./domain-model/OMComponent";

export interface AppWidgetProps {
  app: Application;
}
export const App = styled.div`
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  min-height: 100%;
`;

export const Header = styled.div`
  display: flex;
  background: rgb(30, 30, 30);
  flex-grow: 0;
  flex-shrink: 0;
  color: white;
  font-family: Helvetica, Arial, sans-serif;
  padding: 10px;
  align-items: center;
  font-size: x-large;
`;

export const Content = styled.div`
  display: flex;
  flex-grow: 1;
`;

export const Workspace = styled.div`
  position: relative;
  flex-grow: 1;
`;

export class AppWidget extends React.Component<AppWidgetProps> {
  private onDropEventHandler(event) {
    const eventData: string = event.dataTransfer.getData(
      "lib-item-drag-event-data"
    );
    if (eventData) {
      const omComponentLibrary = this.props.app.getComponentLibrary();
      const data: NodeEventData = JSON.parse(eventData);
      const node: OMComponent = omComponentLibrary.getComponentById(
        data.componentId
      );

      let point = this.props.app
        .getDiagramEngine()
        .getRelativeMousePoint(event);
      point.x = point.x - node.size.width / 2;
      point.y = point.y - node.size.height / 2;
      node.setPosition(point);
      this.props.app.getDiagramEngine().getModel().addNode(node);
    }
    this.forceUpdate();
  }

  render() {
    return (
      <App>
        <Header>
          <div className="title">OMWebEdit</div>
        </Header>
        <Content>
          <ComponentLibraryWidget app={this.props.app} />
          <Workspace
            onDrop={(event) => {
              this.onDropEventHandler(event);
            }}
            onDragOver={(event) => {
              event.preventDefault();
            }}
          >
            <CanvasWidget
              engine={this.props.app.getDiagramEngine()}
              className="canvas"
            />
          </Workspace>
        </Content>
      </App>
    );
  }

  static defaultProps = { app: new Application() };
}
