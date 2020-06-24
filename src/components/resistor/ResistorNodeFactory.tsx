import { ResistorNodeWidget } from './ResistorNodeWidget';
import { ResistorNodeModel } from './ResistorNodeModel';
import * as React from 'react';
import { AbstractReactFactory } from '@projectstorm/react-canvas-core';
import { DiagramEngine } from '@projectstorm/react-diagrams-core';

export class ResistorNodeFactory extends AbstractReactFactory<ResistorNodeModel, DiagramEngine> {
	constructor() {
		super('resistor');
	}

	generateReactWidget(event): JSX.Element {
		return <ResistorNodeWidget engine={this.engine} size={50} node={event.model} />;
	}

	generateModel(event) {
		return new ResistorNodeModel();
	}
}
