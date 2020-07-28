import * as React from "react";
import { OMComponentModel } from "./OMComponentModel";
import { DiagramEngine, PortWidget } from "@projectstorm/react-diagrams";
import styled from "@emotion/styled";

import { OMPortModel } from "./OMPortModel";

export interface OMComponentWidgetProps {
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
  cursor: pointer;
  background-image: ${(props) => `url(${props["data-portimage"]})`};
`;

export class OMComponentWidget extends React.Component<OMComponentWidgetProps> {
  getPortWidget(topStyle, leftStyle, port, svgPath) {
    return (
      <PortWidget
        style={{
          top: topStyle,
          left: leftStyle,
          position: "absolute",
        }}
        key={port.getName()}
        port={this.props.node.getPort(port.getName())}
        engine={this.props.engine}
      >
        <Port data-portimage={svgPath} />
      </PortWidget>
    );
  }

  render() {
    const portWidth = 16;
    let portWidgets: JSX.Element[] = [];
    for (let portName in this.props.node.getPorts()) {
      const port: OMPortModel = this.props.node.getPort(portName);
      const portOptions = port.getOptions();
      // TODO: My novice TS skills fail me here. What's the correct way to access 'placement' attribute without the
      // compiler complaining?
      const placement: ConnectorPlacement = portOptions["placement"];
      const svgPath = portOptions["svgPath"];
      const topMargin =
        this.props.node.size.height - placement.bottomLeft.y - portWidth / 2;
      const leftMargin = placement.bottomLeft.x;
      portWidgets.push(
        this.getPortWidget(topMargin, leftMargin, port, svgPath)
      );
    }

    return (
      <div
        className={
          "omwebedit-default-node rotation-" + this.props.node.rotation
        }
        style={{
          position: "relative",
          width: this.props.node.size.width,
          height: this.props.node.size.height,
        }}
      >
        <img
          src={this.props.node.icon + ".svg"}
          alt={this.props.node.icon + "-icon"}
          width="100%"
        />
        {portWidgets}
      </div>
    );
  }
}
