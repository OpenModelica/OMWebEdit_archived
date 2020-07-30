import styled from "@emotion/styled";
import React from "react";
import { LibraryItemWidget } from "./LibraryItemWidget";

export const Library = styled.div`
  min-width: 200px;
  background: rgb(20, 20, 20);
  flex-grow: 0;
  flex-shrink: 0;
`;

export class LibraryWidget extends React.Component {
  render() {
    return (
      <Library>
        <LibraryItemWidget
          nodeEventData={{
            componentId: "Modelica.Electrical.Analog.Basic.Inductor",
          }}
          name="Inductor"
          color="rgb(192,255,0)"
        />
        <LibraryItemWidget
          nodeEventData={{
            componentId: "Modelica.Electrical.Analog.Basic.Ground",
          }}
          name="Ground"
          color="rgb(0,192,255)"
        />
      </Library>
    );
  }
}
