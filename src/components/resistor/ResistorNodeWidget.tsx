import * as React from 'react';
import { ResistorNodeModel } from './ResistorNodeModel';
import { DiagramEngine, PortModelAlignment, PortWidget } from '@projectstorm/react-diagrams';
import styled from '@emotion/styled';
import ReactLogo from './../../logo.svg';
import ResistorIcon from './Resistor-icon.svg';

export interface ResistorNodeWidgetProps {
	node: ResistorNodeModel;
	engine: DiagramEngine;
	size?: number;
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

export class ResistorNodeWidget extends React.Component<ResistorNodeWidgetProps> {
	render() {
		return (
			<div
				className={'resistor-node'}
				style={{
					position: 'relative',
					width: this.props.size,
					height: this.props.size
				}}>
				<img src={ResistorIcon} alt="Resistor Icon" width="100%"/>
				<PortWidget
					style={{
						top: this.props.size / 2 - 8,
						left: -8,
						position: 'absolute'
					}}
					port={this.props.node.getPort(PortModelAlignment.LEFT)}
					engine={this.props.engine}>
					<Port />
				</PortWidget>
				<PortWidget
					style={{
						left: this.props.size - 8,
						top: this.props.size / 2 - 8,
						position: 'absolute'
					}}
					port={this.props.node.getPort(PortModelAlignment.RIGHT)}
					engine={this.props.engine}>
					<Port />
				</PortWidget>
			</div>
		);
	}
}
