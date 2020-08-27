import React from "react";
import { render } from "@testing-library/react";
import { OMComponentWidget } from "../OMComponentWidget";
import { OMComponent } from "../../../domain-model/OMComponent";
import { OMPort } from "../../../domain-model/OMPort";

const testComponentDisplayLabel = "test-component-display-label";
let node;

function getPort(portId: string): OMPort {
  return new OMPort(portId, "/test-port-svgPath", {
    bottomLeft: { x: 10, y: 10 },
    rotation: 0,
  });
}

beforeAll(() => {
  node = new OMComponent(
    "test-component-id",
    testComponentDisplayLabel,
    "/test-component-svg-path",
    { width: 100, height: 100 }
  );
  // supply an ID so that the framework doesn't use a random UUID which results
  // in DOM snapshot changing with each instantiation
  node.options.id = "test-node-id";
  node.addPort(getPort("test-port-id-1"));
  node.addPort(getPort("test-port-id-2"));
});

test("custom node renders with expected styling and ports", () => {
  const { getByTestId } = render(<OMComponentWidget node={node} />);

  expect(getByTestId(testComponentDisplayLabel)).toMatchInlineSnapshot(`
    .emotion-0 {
      width: 16px;
      height: 16px;
      z-index: 10;
      cursor: pointer;
      background-image: url(/test-port-svgPath);
    }

    <div
      data-testid="test-component-display-label"
      style="position: relative; width: 100px; height: 100px;"
    >
      <img
        alt="test-component-id"
        draggable="false"
        src="/test-component-svg-path"
        width="100%"
      />
      <div
        class="port "
        data-name="test-port-id-1"
        data-nodeid="test-node-id"
        style="top: 82px; left: 10px; position: absolute;"
      >
        <div
          class="emotion-0"
          data-portimage="/test-port-svgPath"
        />
      </div>
      <div
        class="port "
        data-name="test-port-id-2"
        data-nodeid="test-node-id"
        style="top: 82px; left: 10px; position: absolute;"
      >
        <div
          class="emotion-0"
          data-portimage="/test-port-svgPath"
        />
      </div>
    </div>
  `);
});
