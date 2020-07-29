import * as React from "react";
import { TrayWidget } from "./TrayWidget";
import { Application } from "../Application";
import { NodeEventData, TrayItemWidget } from "./TrayItemWidget";
import { CanvasWidget } from "@projectstorm/react-canvas-core";
import styled from "@emotion/styled";
import { OMComponent } from "../domain-model/OMComponent";
import { OMComponentLibrary } from "../domain-model/OMComponentLibrary";

export interface BodyWidgetProps {
  app: Application;
}
export const Body = styled.div`
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
`;

export const Content = styled.div`
  display: flex;
  flex-grow: 1;
`;

export const Layer = styled.div`
  position: relative;
  flex-grow: 1;
`;

export class BodyWidget extends React.Component<BodyWidgetProps> {
  private onDropEventHandler(event) {
    const eventData: string = event.dataTransfer.getData(
      "nodeEventData-lib-drag-event-data"
    );
    if (eventData) {
      const omComponentLibrary = new OMComponentLibrary();
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
      <Body>
        <Header>
          <div className="title">Storm React Diagrams - DnD foo demo</div>
        </Header>
        <Content>
          <TrayWidget>
            <TrayItemWidget
              nodeEventData={{
                componentId: "Modelica.Electrical.Analog.Basic.Inductor",
              }}
              name="Inductor"
              color="rgb(192,255,0)"
            />
            <TrayItemWidget
              nodeEventData={{
                componentId: "Modelica.Electrical.Analog.Basic.Ground",
              }}
              name="Ground"
              color="rgb(0,192,255)"
            />
          </TrayWidget>
          <Layer
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
          </Layer>
        </Content>
      </Body>
    );
  }
}
