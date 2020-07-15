import * as React from "react";
import { OMComponentModel } from "./OMComponentModel";
import { DiagramEngine, PortWidget } from "@projectstorm/react-diagrams";
import styled from "@emotion/styled";
import { OMPortModel } from "./OMPortModel";

export interface OMWebEditDefaultNodeWidgetProps {
  node: OMComponentModel;
  engine: DiagramEngine;
  size?: number;
}

interface ConnectorPlacement {
  bottomLeft: {
    x: number;
    y: number;
  };
}

export const Port = styled.div`
  width: 16px;
  height: 16px;
  z-index: 10;
  background: rgba(0, 0, 0, 0.5);
  border-radius: 8px;
  cursor: pointer;

  &:hover {
    background: rgba(0, 0, 0, 1);
  }
`;

export class OMComponentWidget extends React.Component<
  OMWebEditDefaultNodeWidgetProps
> {
  getPortWidget(topStyle, leftStyle, port) {
    return (
      <PortWidget
        style={{
          top: topStyle,
          left: leftStyle,
          position: "absolute",
        }}
        port={this.props.node.getPort(port.getName())}
        engine={this.props.engine}
      >
        <Port />
      </PortWidget>
    );
  }

  render() {
    let portWidgets: JSX.Element[] = [];
    for (let portName in this.props.node.getPorts()) {
      const port: OMPortModel = this.props.node.getPort(portName);
      let portOptions = port.getOptions();
      // TODO: My novice TS skills fail me here. What's the correct way to access 'placement' attribute without the
      // compiler complaining?
      let placement: ConnectorPlacement = portOptions["placement"];
      console.log(placement);
      console.log(this.props.size);
      const topMargin = this.props.size - placement.bottomLeft.y;
      const leftMargin = placement.bottomLeft.x;
      portWidgets.push(this.getPortWidget(topMargin, leftMargin, port));
    }

    return (
      <div
        className={
          "omwebedit-default-node rotation-" + this.props.node.rotation
        }
        style={{
          position: "relative",
          width: this.props.size,
          height: this.props.size,
        }}
      >
        <img
          src={this.props.node.icon + "-icon.svg"}
          alt={this.props.node.icon + "-icon"}
          width="100%"
        />
        {portWidgets[0]}
      </div>
    );
  }
}
