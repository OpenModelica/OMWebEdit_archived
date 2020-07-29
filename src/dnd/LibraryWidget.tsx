import styled from "@emotion/styled";
import React from "react";

export const Library = styled.div`
  min-width: 200px;
  background: rgb(20, 20, 20);
  flex-grow: 0;
  flex-shrink: 0;
`;

export class LibraryWidget extends React.Component {
  render() {
    return <Library>{this.props.children}</Library>;
  }
}
