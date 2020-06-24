import { OMWebEditNodeWidget } from './OMWebEditNodeWidget';
import { OMWebEditDefaultNodeModel } from './OMWebEditDefaultNodeModel';
import * as React from 'react';
import { AbstractReactFactory } from '@projectstorm/react-canvas-core';
import { DiagramEngine } from '@projectstorm/react-diagrams-core';

export class OMWebEditDefaultNodeFactory extends AbstractReactFactory<OMWebEditDefaultNodeModel, DiagramEngine> {
	constructor() {
		super('omwebedit-default-node');
	}

	generateReactWidget(event): JSX.Element {
		return <OMWebEditNodeWidget engine={this.engine} size={100} node={event.model} />;
	}

	generateModel(event) {
		return new OMWebEditDefaultNodeModel("default");
	}
}
