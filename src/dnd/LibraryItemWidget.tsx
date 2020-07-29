import * as React from "react";
import styled from "@emotion/styled";

export type NodeEventData = { componentId: string };

export interface LibraryItemWidgetProps {
  nodeEventData: NodeEventData;
  color?: string;
  name: string;
}

export const LibraryItem = styled.div<{ color: string }>`
  color: white;
  font-family: Helvetica, Arial;
  padding: 5px;
  margin: 0px 10px;
  border: solid 1px ${(p) => p.color};
  border-radius: 5px;
  margin-bottom: 2px;
  cursor: pointer;
`;

export class LibraryItemWidget extends React.Component<LibraryItemWidgetProps> {
  render() {
    return (
      <LibraryItem
        color={this.props.color}
        draggable={true}
        onDragStart={(event) => {
          event.dataTransfer.setData(
            "nodeEventData-lib-drag-event-data",
            JSON.stringify(this.props.nodeEventData)
          );
        }}
        className="tray-item"
      >
        {this.props.name}
      </LibraryItem>
    );
  }
}
