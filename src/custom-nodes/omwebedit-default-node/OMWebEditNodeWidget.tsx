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

	getPortWidget(topStyle, leftStyle, port) {
		return (
			<PortWidget
				style={{
					top: topStyle,
					left: leftStyle,
					position: 'absolute'
				}}
				port={this.props.node.getPort(port)}
				engine={this.props.engine}>
				<Port />
			</PortWidget>
		);
	}

	render() {

		let leftPortWidget, rightPortWidget, topPortWidget, bottomPortWidget;

		if (this.props.node.getPort(PortModelAlignment.LEFT)) {
			leftPortWidget = this.getPortWidget(
				this.props.size / 2 - 8,
				-8,
				PortModelAlignment.LEFT
			);
		}

		if(this.props.node.getPort(PortModelAlignment.RIGHT)) {
			rightPortWidget = this.getPortWidget(
				this.props.size / 2 - 8,
				this.props.size - 8,
				PortModelAlignment.RIGHT
			);
		}

		if (this.props.node.getPort(PortModelAlignment.TOP)) {
			topPortWidget = this.getPortWidget(
				-8,
				this.props.size / 2 - 8,
				PortModelAlignment.TOP
			);
		}

		if (this.props.node.getPort(PortModelAlignment.BOTTOM)) {
			bottomPortWidget = this.getPortWidget(
				this.props.size - 8,
				this.props.size / 2 - 8,
				PortModelAlignment.BOTTOM
			);
		}

		return (
			<div
				className={'omwebedit-default-node rotation-'+this.props.node.rotation}
				style={{
					position: 'relative',
					width: this.props.size,
					height: this.props.size
				}}>
				<img src={this.props.node.icon+"-icon.svg"} alt={this.props.node.icon + "-icon"} width="100%"/>
				{leftPortWidget}
				{rightPortWidget}
				{topPortWidget}
				{bottomPortWidget}
			</div>
		);
	}
}
