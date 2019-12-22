#!/usr/bin/env python3

import sys
from os import popen
from collections import Counter
from math import log

def factory(nodesOnDesktop,  node_range, gap_range):
	g = 0.98
	ya, yb = gap_range
	xa, xb = node_range
	
	gr = yb - ya
	nr = xb -xa

	s = (g**gr - 1)/nr
	
	#gradient = (yb - ya)/(xb - xa)
	#intercept = ya - gradient/xa

	def reset(desktop):
		count = nodesOnDesktop[desktop]

		if node_range[0] <= count and count <= node_range[1]:
			# wgap = round(gradient * count + intercept)
			wgap = round(log((count - xa) * s + 1)/log(g) + ya) 
			popen(f"bspc config -d {desktop} window_gap {wgap}")

	return reset

def get_node_counts():
	desktops = popen('bspc query -N -n .leaf | parallel bspc query -D -n').read()
	
	return Counter(desktops.strip().split("\n"))

def main(min_nodes, max_nodes, max_gap, min_gap):

	nodesOnDesktop = get_node_counts()

	node_range = (min_nodes, max_nodes)
	gap_range = (max_gap, min_gap)

	reset = factory(nodesOnDesktop, node_range, gap_range)

	with popen('bspc subscribe node_add node_remove node_transfer') as stream:

		line = stream.readline()

		while line:
			action, _, *options = line.split(' ')

			if action == 'node_transfer':
				from_node, _, _, to_node, *_ = options
				nodesOnDesktop[from_node] -= 1
				nodesOnDesktop[to_node] += 1
				reset(from_node)
				reset(to_node)

			else:
				desktop, *_ = options

				if action == 'node_add':
					nodesOnDesktop[desktop] += 1
				else:
					nodesOnDesktop[desktop] -= 1

				reset(desktop)
			line = stream.readline()

args = map(int, sys.argv[1:])
main(*args)
