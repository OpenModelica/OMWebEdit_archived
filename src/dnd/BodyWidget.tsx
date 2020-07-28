import * as React from "react";
import { TrayWidget } from "./TrayWidget";
import { Application } from "../Application";
import { TrayItemWidget } from "./TrayItemWidget";
import { CanvasWidget } from "@projectstorm/react-canvas-core";
import styled from "@emotion/styled";
import { OMComponent } from "../domain-model/OMComponent";
import inductorJson from "../component-inductor.json";
import groundJson from "../component-ground.json";
import { OMPort } from "../domain-model/OMPort";

export interface BodyWidgetProps {
  app: Application;
}

function getNodeFromServerResponse(nodeJson) {
  let node = new OMComponent(nodeJson.id, nodeJson.svgPath, nodeJson.size);
  nodeJson.connectors.forEach((connector) => {
    const port: OMPort = new OMPort(
      connector.id,
      connector.svgPath,
      connector.placement
    );
    node.addPort(port);
  });
  return node;
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
  render() {
    return (
      <Body>
        <Header>
          <div className="title">Storm React Diagrams - DnD foo demo</div>
        </Header>
        <Content>
          {/*{console.log(this.props.app.getComponentLibrary().getAllComponents())}*/}
          <TrayWidget>
            <TrayItemWidget
              model={{ type: "in" }}
              name="In Node"
              color="rgb(192,255,0)"
            />
            <TrayItemWidget
              model={{ type: "out" }}
              name="Out Node"
              color="rgb(0,192,255)"
            />
          </TrayWidget>
          <Layer
            onDrop={(event) => {
              var data = JSON.parse(
                event.dataTransfer.getData("storm-diagram-node")
              );

              var node: OMComponent = null;
              if (data.type === "in") {
                node = getNodeFromServerResponse(inductorJson);
              } else {
                node = getNodeFromServerResponse(groundJson);
              }
              var point = this.props.app
                .getDiagramEngine()
                .getRelativeMousePoint(event);
              node.setPosition(point);
              this.props.app.getDiagramEngine().getModel().addNode(node);
              this.forceUpdate();
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
