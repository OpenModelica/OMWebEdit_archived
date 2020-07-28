import * as React from "react";
import { OMComponent } from "../../domain-model/OMComponent";
import { DiagramEngine, PortWidget } from "@projectstorm/react-diagrams";
import styled from "@emotion/styled";
import { OMPort } from "../../domain-model/OMPort";
import { Tray } from "../../dnd/TrayItemWidget";
import { Layer } from "../../dnd/BodyWidget";

export interface OMComponentWidgetProps {
  node: OMComponent;
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
        onDragOver={(event) => {
          event.preventDefault();
        }}
      >
        <Port data-portimage={svgPath} />
      </PortWidget>
    );
  }

  render() {
    const portWidth = 16;
    let portWidgets: JSX.Element[] = [];
    for (let portName in this.props.node.getPorts()) {
      const port: OMPort = this.props.node.getPort(portName);
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
        style={{
          position: "relative",
          width: this.props.node.size.width,
          height: this.props.node.size.height,
        }}
        draggable={true}
        onDragStart={(event) => {
          event.dataTransfer.setData("iconId", null);
        }}
        onDragOver={(event) => {
          event.preventDefault();
        }}
      >
        <img
          src={this.props.node.svgPath}
          alt={this.props.node.iconId}
          width="100%"
        />
        {portWidgets}
      </div>
    );
  }
}
