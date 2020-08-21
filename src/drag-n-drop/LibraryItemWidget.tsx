import * as React from "react";
import styled from "@emotion/styled";

export type NodeEventData = { componentId: string };

export interface LibraryItemWidgetProps {
  nodeEventData: NodeEventData;
  color?: string;
  name: string;
}

export const LibraryItem = styled.div`
  color: white;
  font-family: Helvetica, Arial, serif;
  padding: 5px;
  border: solid 1px rgb(192, 255, 0);
  border-radius: 5px;
  margin: 0 10px 2px;
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
            "lib-item-drag-event-data",
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
