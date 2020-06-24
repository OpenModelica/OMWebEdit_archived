import * as React from 'react';
import { OMWebEditDefaultNodeModel } from './OMWebEditDefaultNodeModel';
import { DiagramEngine, PortModelAlignment, PortWidget } from '@projectstorm/react-diagrams';
import styled from '@emotion/styled';

export interface OMWebEditDefaultNodeWidgetProps {
	node: OMWebEditDefaultNodeModel;
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

export class OMWebEditNodeWidget extends React.Component<OMWebEditDefaultNodeWidgetProps> {
	render() {
		return (
			<div
				className={'omwebedit-default-node rotation-'+this.props.node.rotation}
				style={{
					position: 'relative',
					width: this.props.size,
					height: this.props.size
				}}>
				<img src={this.props.node.icon+"-icon.svg"} alt={this.props.node.icon + "-icon"} width="100%"/>
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
